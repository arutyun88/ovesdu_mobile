import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ovesdu_mobile/app/const/const.dart';
import 'package:ovesdu_mobile/app/data/setting_provider/setting_provider.dart';
import 'package:ovesdu_mobile/app/di/init_di.dart';
import 'package:ovesdu_mobile/feature/profile/domain/state/profile_cubit.dart';
import 'package:ovesdu_mobile/feature/profile/ui/components/item_divider.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/ui/config/app_colors.dart';
import '../domain/entities/user_profile_follower/user_profile_follower_item_entity.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({
    Key? key,
    required this.followers,
    required this.following,
    required this.clickedIsFollowers,
    required this.size,
  }) : super(key: key);

  final List<UserProfileFollowerItemEntity> followers;
  final List<UserProfileFollowerItemEntity> following;
  final bool clickedIsFollowers;
  final Size size;

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
        ),
      },
      {
        followingKey: _FollowList(
          itemsKey: followingKey,
          items: widget.following,
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
  }) : super(key: key);

  final String itemsKey;
  final List<UserProfileFollowerItemEntity> items;

  @override
  Widget build(BuildContext context) {
    final userId = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (profile) => profile.id) ??
        0;
    final list = <UserProfileFollowerItemEntity>[];
    final i = items.where((e) => int.parse(e.id) == userId).toList();
    if (i.isNotEmpty) {
      list.add(i.first);
      items.remove(i.first);
    }
    items.sort(
      (left, right) => left.firstName.toLowerCase().compareTo(
            right.firstName.toLowerCase(),
          ),
    );
    list.addAll(items);
    return ListView(
      key: PageStorageKey<String>(itemsKey),
      children: list
          .map(
            (item) => _FollowerItem(item),
          )
          .toList(),
    );
  }
}

class _FollowerItem extends StatelessWidget {
  const _FollowerItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  final UserProfileFollowerItemEntity item;

  @override
  Widget build(BuildContext context) {
    final avatarCircle = Provider.of<SettingProvider>(context).isCircleAvatar;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final userId = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (profile) => profile.id) ??
        0;
    final dictionary = AppLocalizations.of(context)!;

    return Column(
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
                    shape: avatarCircle ? BoxShape.circle : BoxShape.rectangle,
                    borderRadius:
                        avatarCircle ? null : BorderRadius.circular(16),
                    color: AppColors.hintTextColor,
                    border: Border.all(
                      color: AppColors.orange,
                      width: 2,
                      strokeAlign: StrokeAlign.outside,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    'https://caknowledge.com/wp-content/uploads/2022/05/Chuck-'
                    'Norris-Net-Worth-100-million.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              userId != int.parse(item.id)
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        top: 12,
                        bottom: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.firstName,
                            style: theme.textTheme.headline6,
                          ),
                          Text(
                            item.lastName,
                            style: theme.textTheme.headline6?.copyWith(
                              color: AppColors.hintTextColor,
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
              if (userId != int.parse(item.id))
                const Text(
                  'following',
                ),
            ],
          ),
        ),
        const ItemDivider(),
      ],
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
