import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ovesdu_mobile/app/ui/components/buttons/empty_button.dart';
import 'package:ovesdu_mobile/feature/profile/domain/profile_repository.dart';
import 'package:ovesdu_mobile/feature/profile/domain/state/user_profile_follower/my_followers_cubit.dart';
import 'package:ovesdu_mobile/feature/profile/ui/user_profile_screen.dart';
import 'package:provider/provider.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/setting_provider.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/ui/config/app_colors.dart';
import '../domain/entities/user_profile_follower/user_profile_follower_item_entity.dart';
import '../domain/entities/user_profile_follower/user_simple_followers_entity.dart';
import '../domain/state/profile_cubit.dart';
import 'components/item_divider.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({
    Key? key,
    required this.followers,
    required this.following,
    required this.clickedIsFollowers,
    required this.size,
    required this.myFollowers,
    required this.blackList,
    required this.cubit,
  }) : super(key: key);

  final List<UserProfileFollowerItemEntity> followers;
  final List<UserProfileFollowerItemEntity> following;
  final bool clickedIsFollowers;
  final Size size;
  final UserSimpleFollowersEntity? myFollowers;
  final List<int> blackList;
  final MyFollowersCubit cubit;

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  late ThemeData theme;

  late int currentPage = widget.clickedIsFollowers ? 0 : 1;
  late PageController pageController = PageController(initialPage: currentPage);

  late List<Map<String, Widget>> pages;

  late double verticalPadding;
  late double horizontalPadding;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Provider.of<ThemeProvider>(context).themeData;

    final media = MediaQuery.of(context).size;
    verticalPadding = (media.height - widget.size.height) / 2;
    horizontalPadding = (media.width - widget.size.width) / 2;

    final followersKey = AppLocalizations.of(context)!.followers;
    final followingKey = AppLocalizations.of(context)!.following;
    pages = [
      {
        followersKey: _FollowList(
          itemsKey: followersKey,
          items: widget.followers,
          myFollowers: widget.myFollowers,
          blackList: widget.blackList,
        ),
      },
      {
        followingKey: _FollowList(
          itemsKey: followingKey,
          items: widget.following,
          myFollowers: widget.myFollowers,
          blackList: widget.blackList,
        ),
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: theme.backgroundColor.withOpacity(.95),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      pages.length,
                      (index) => GestureDetector(
                        onTap: () => _changePage(index),
                        child: _TabButtonItem(
                          title: pages[index].keys.first,
                          index: index,
                          currentPage: currentPage,
                        ),
                      ),
                    ),
                  ),
                  const ItemDivider(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    (verticalPadding * 2),
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) => setState(() => currentPage = index),
                  children: pages.map((page) => page.values.first).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changePage(int index) {
    currentPage = index;
    pageController.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }
}

class _FollowList extends StatelessWidget {
  const _FollowList({
    Key? key,
    required this.itemsKey,
    required this.items,
    required this.myFollowers,
    required this.blackList,
  }) : super(key: key);

  final String itemsKey;
  final List<UserProfileFollowerItemEntity> items;
  final UserSimpleFollowersEntity? myFollowers;
  final List<int> blackList;

  List<UserProfileFollowerItemEntity> _sort(
    List<UserProfileFollowerItemEntity> items,
    int currentUserId,
  ) {
    final result = <UserProfileFollowerItemEntity>[];

    final copy = items.map((e) => e).toList();

    final its = copy.where((e) => int.parse(e.id) == currentUserId).toList();
    if (its.isNotEmpty) {
      result.add(its.first);
      copy.remove(its.first);
    }

    copy.sort(
      (left, right) => left.firstName.toLowerCase().compareTo(
            right.firstName.toLowerCase(),
          ),
    );
    result.addAll(copy);

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final userId = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (profile) => profile.id) ??
        0;

    var sortedList = _sort(items, userId);

    return ListView(
      key: PageStorageKey<String>(itemsKey),
      children: sortedList.map(
        (item) {
          final isBlocked = blackList.contains(int.parse(item.id));

          return _FollowerItem(
            item,
            myFollowers,
            isBlocked: isBlocked,
          );
        },
      ).toList(),
    );
  }
}

class _FollowerItem extends StatefulWidget {
  const _FollowerItem(
    this.item,
    this.myFollowers, {
    Key? key,
    required this.isBlocked,
  }) : super(key: key);

  final UserProfileFollowerItemEntity item;
  final UserSimpleFollowersEntity? myFollowers;
  final bool isBlocked;

  @override
  State<_FollowerItem> createState() => _FollowerItemState();
}

class _FollowerItemState extends State<_FollowerItem> {
  late bool avatarCircle;
  late ThemeData theme;
  late TextStyle? buttonStyle;
  late int userId;
  late AppLocalizations dictionary;
  late ValueNotifier<bool> clicked;

  @override
  void initState() {
    super.initState();

    clicked = ValueNotifier(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    avatarCircle = Provider.of<SettingProvider>(context).isCircleAvatar;
    theme = Provider.of<ThemeProvider>(context).themeData;
    buttonStyle = theme.textTheme.bodyText1;

    userId = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (profile) => profile.id) ??
        0;
    dictionary = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyFollowersCubit(locator.get<ProfileRepository>()),
      child: BlocConsumer<MyFollowersCubit, MyFollowersState>(
        listener: (context, state) {
          state.whenOrNull(
            created: (id) {
              widget.myFollowers?.following.add(id);
              clicked.value = false;
            },
            deleted: (id) {
              widget.myFollowers?.following.remove(id);
              clicked.value = false;
            },
          );
        },
        builder: (context, state) => ValueListenableBuilder<bool>(
            valueListenable: clicked,
            builder: (context, isClicked, child) {
              final cubit = context.read<MyFollowersCubit>();
              return GestureDetector(
                onTap: widget.isBlocked
                    ? () {}
                    : isClicked
                        ? () {}
                        : () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UserProfileScreen(
                                  userId: widget.item.id,
                                  firsName: widget.item.firstName,
                                  lastName: widget.item.lastName,
                                  image: widget.item.image,
                                ),
                              ),
                            );
                          },
                child: Container(
                  color: AppColors.transparent,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: mainPadding / 2,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: verticalPadding,
                                top: verticalPadding * 2,
                              ),
                              child: Container(
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  shape: avatarCircle
                                      ? BoxShape.circle
                                      : BoxShape.rectangle,
                                  borderRadius: avatarCircle
                                      ? null
                                      : BorderRadius.circular(16),
                                  color: AppColors.hintTextColor,
                                  border: Border.all(
                                    color: widget.isBlocked
                                        ? AppColors.orange.withOpacity(.3)
                                        : AppColors.orange,
                                    width: 2,
                                    strokeAlign: StrokeAlign.outside,
                                  ),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.network(
                                      widget.item.image,
                                      fit: BoxFit.cover,
                                    ),
                                    if (widget.isBlocked)
                                      Container(
                                        color: theme.backgroundColor
                                            .withOpacity(.7),
                                      )
                                  ],
                                ),
                              ),
                            ),
                            userId != int.parse(widget.item.id)
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      top: 12,
                                      bottom: 4,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.item.firstName,
                                          style: widget.isBlocked
                                              ? theme.textTheme.headline6
                                                  ?.apply(
                                                      color: theme.textTheme
                                                          .headline6?.color
                                                          ?.withOpacity(.3))
                                              : theme.textTheme.headline6,
                                        ),
                                        Text(
                                          widget.item.lastName,
                                          style: theme.textTheme.headline6
                                              ?.copyWith(
                                            color: widget.isBlocked
                                                ? AppColors.hintTextColor
                                                    .withOpacity(.3)
                                                : AppColors.hintTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      top: 12,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      dictionary.i,
                                      style: theme.textTheme.headline6,
                                    ),
                                  ),
                            const Spacer(),
                            if (userId != int.parse(widget.item.id))
                              widget.isBlocked
                                  ? Text(
                                      'заблокирован',
                                      style: buttonStyle?.copyWith(
                                        color: AppColors.hintTextColor,
                                      ),
                                    )
                                  : (widget.myFollowers?.following ?? [])
                                          .contains(int.parse(widget.item.id))
                                      ? EmptyButton(
                                          onPressed: isClicked
                                              ? null
                                              : () {
                                                  clicked.value = true;
                                                  cubit.deleteFollowing(
                                                      widget.item.id);
                                                },
                                          child: isClicked
                                              ? Text(
                                                  'ожидание...',
                                                  textAlign: TextAlign.right,
                                                  style: buttonStyle?.copyWith(
                                                    fontStyle: FontStyle.italic,
                                                    color:
                                                        AppColors.hintTextColor,
                                                  ),
                                                )
                                              : Text(
                                                  'вы подписаны\nотписаться?',
                                                  textAlign: TextAlign.right,
                                                  style: buttonStyle?.copyWith(
                                                    color:
                                                        AppColors.hintTextColor,
                                                  ),
                                                ),
                                        )
                                      : (widget.myFollowers?.followers ?? [])
                                              .contains(
                                                  int.parse(widget.item.id))
                                          ? EmptyButton(
                                              onPressed: isClicked
                                                  ? null
                                                  : () {
                                                      clicked.value = true;
                                                      cubit.createFollowing(
                                                          widget.item.id);
                                                    },
                                              child: isClicked
                                                  ? Text(
                                                      'ожидание...',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style:
                                                          buttonStyle?.copyWith(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: AppColors
                                                            .hintTextColor,
                                                      ),
                                                    )
                                                  : Text(
                                                      'подписан на вас\nподписаться в ответ?',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style:
                                                          buttonStyle?.copyWith(
                                                        color: AppColors.orange,
                                                      ),
                                                    ),
                                            )
                                          : EmptyButton(
                                              onPressed: isClicked
                                                  ? null
                                                  : () {
                                                      clicked.value = true;
                                                      cubit.createFollowing(
                                                          widget.item.id);
                                                    },
                                              child: isClicked
                                                  ? Text(
                                                      'ожидание...',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style:
                                                          buttonStyle?.copyWith(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: AppColors
                                                            .hintTextColor,
                                                      ),
                                                    )
                                                  : Text(
                                                      'подписаться',
                                                      style:
                                                          buttonStyle?.copyWith(
                                                        color: AppColors.orange,
                                                      ),
                                                    ),
                                            ),
                          ],
                        ),
                      ),
                      const ItemDivider(),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class _TabButtonItem extends StatelessWidget {
  const _TabButtonItem({
    Key? key,
    required this.title,
    required this.index,
    required this.currentPage,
  }) : super(key: key);

  final String title;
  final int index;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final theme =
        Provider.of<ThemeProvider>(context).themeData.textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: theme?.apply(
          color:
              currentPage == index ? theme.color : theme.color?.withOpacity(.6),
        ),
      ),
    );
  }
}
