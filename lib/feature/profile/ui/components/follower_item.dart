import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/di/init_di.dart';
import '../../../../app/helpers/app_icons.dart';
import '../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../app/ui/components/custom_page_route.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/state/profile_cubit.dart';
import '../../domain/state/user_blocked/user_blocked_cubit.dart';
import '../../domain/state/user_profile_follower/my_followers_cubit.dart';
import '../user_profile_screen.dart';

class FollowerItem extends StatefulWidget {
  const FollowerItem(
    this.item,
    this.myFollowers, {
    Key? key,
    required this.isBlocked,
  }) : super(key: key);

  final UserProfileFollowerItemEntity item;
  final UserSimpleFollowersEntity? myFollowers;
  final bool isBlocked;

  @override
  State<FollowerItem> createState() => _FollowerItemState();
}

class _FollowerItemState extends State<FollowerItem> {
  late bool avatarCircle;
  late ThemeData theme;
  late TextStyle? buttonStyle;
  late int userId;
  late AppLocalizations dictionary;
  late ValueNotifier<bool> clicked;

  late bool _isBlocked;

  @override
  void initState() {
    super.initState();

    clicked = ValueNotifier(false);

    _isBlocked = widget.isBlocked;
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
    final mainStyle = theme.textTheme.headline6;
    const avatarSize = 56.0;
    const leftPadding = 16.0;

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
                onTap: userId == int.parse(widget.item.id) || isClicked
                    ? () {}
                    : _itemOnTap,
                child: Container(
                  color: AppColors.transparent,
                  child: Padding(
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
                            height: avatarSize,
                            width: avatarSize,
                            decoration: BoxDecoration(
                              shape: avatarCircle
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                              borderRadius: avatarCircle
                                  ? null
                                  : BorderRadius.circular(16),
                              color: AppColors.hintTextColor.withOpacity(.1),
                              border: Border.all(
                                color: _isBlocked
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
                                widget.item.image != null
                                    ? Image.network(
                                        widget.item.image ?? '',
                                        fit: BoxFit.cover,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SvgPicture.asset(
                                          AppIcons.profileIcon,
                                          color: AppColors.hintTextColor,
                                        ),
                                      ),
                                if (_isBlocked)
                                  Container(
                                    color:
                                        theme.backgroundColor.withOpacity(.7),
                                  )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: leftPadding,
                            top: 12,
                            bottom: 4,
                          ),
                          child: userId == int.parse(widget.item.id)
                              ? Text(dictionary.i, style: mainStyle)
                              : SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      mainPadding -
                                      avatarSize -
                                      leftPadding,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                            ),
                                            child: Text(
                                              widget.item.firstName,
                                              maxLines: 1,
                                              style: _isBlocked
                                                  ? mainStyle?.apply(
                                                      color: mainStyle.color
                                                          ?.withOpacity(.3))
                                                  : mainStyle,
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          if (userId !=
                                              int.parse(widget.item.id))
                                            Flexible(
                                              child: _isBlocked
                                                  ? Text(
                                                      dictionary.blocked,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          buttonStyle?.copyWith(
                                                        color: AppColors
                                                            .hintTextColor
                                                            .withOpacity(.5),
                                                      ),
                                                    )
                                                  : isClicked
                                                      ? Text(
                                                          dictionary.waiting,
                                                          textAlign:
                                                              TextAlign.right,
                                                          maxLines: 1,
                                                          style: buttonStyle
                                                              ?.copyWith(
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            color: AppColors
                                                                .hintTextColor,
                                                          ),
                                                        )
                                                      : _followingContains()
                                                          ? EmptyButton(
                                                              onPressed: isClicked
                                                                  ? null
                                                                  : () =>
                                                                      _clickedDelete(
                                                                          cubit),
                                                              child: Text(
                                                                dictionary
                                                                    .subscribed,
                                                                overflow:
                                                                    TextOverflow
                                                                        .clip,
                                                                maxLines: 1,
                                                                style: buttonStyle
                                                                    ?.copyWith(
                                                                  color: AppColors
                                                                      .hintTextColor,
                                                                ),
                                                              ),
                                                            )
                                                          : _followersContains()
                                                              ? EmptyButton(
                                                                  onPressed: isClicked
                                                                      ? null
                                                                      : () => _clickedCreate(
                                                                          cubit),
                                                                  child: Text(
                                                                    dictionary
                                                                        .subscribedToYou,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .clip,
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                    style: buttonStyle
                                                                        ?.copyWith(
                                                                      color: AppColors
                                                                          .orange,
                                                                    ),
                                                                  ),
                                                                )
                                                              : EmptyButton(
                                                                  onPressed: isClicked
                                                                      ? null
                                                                      : () => _clickedCreate(
                                                                          cubit),
                                                                  child: Text(
                                                                    dictionary
                                                                        .subscribe,
                                                                    style: buttonStyle
                                                                        ?.copyWith(
                                                                      color: AppColors
                                                                          .orange,
                                                                    ),
                                                                  ),
                                                                ),
                                            ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                            ),
                                            child: Text(
                                              widget.item.lastName,
                                              maxLines: 1,
                                              style: mainStyle?.copyWith(
                                                color: _isBlocked
                                                    ? AppColors.hintTextColor
                                                        .withOpacity(.3)
                                                    : AppColors.hintTextColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          if (userId !=
                                                  int.parse(widget.item.id) &&
                                              !_isBlocked)
                                            if (!isClicked)
                                              Flexible(
                                                child: _followingContains()
                                                    ? EmptyButton(
                                                        onPressed: isClicked
                                                            ? null
                                                            : () =>
                                                                _clickedDelete(
                                                                    cubit),
                                                        child: Text(
                                                          dictionary
                                                              .unsubscribeAction,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          maxLines: 1,
                                                          style: buttonStyle
                                                              ?.copyWith(
                                                            color: AppColors
                                                                .hintTextColor,
                                                          ),
                                                        ),
                                                      )
                                                    : _followersContains()
                                                        ? EmptyButton(
                                                            onPressed: isClicked
                                                                ? null
                                                                : () =>
                                                                    _clickedCreate(
                                                                        cubit),
                                                            child: Text(
                                                              dictionary
                                                                  .subscribeToReply,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              maxLines: 1,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: buttonStyle
                                                                  ?.copyWith(
                                                                color: AppColors
                                                                    .orange,
                                                              ),
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                              ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void _clickedCreate(MyFollowersCubit cubit) {
    clicked.value = true;
    cubit.createFollowing(widget.item.id);
  }

  void _clickedDelete(MyFollowersCubit cubit) {
    clicked.value = true;
    cubit.deleteFollowing(widget.item.id);
  }

  void _itemOnTap() {
    Navigator.of(context)
        .push(
          CustomPageRoute(
            child: UserProfileScreen(
              userId: widget.item.id,
              firsName: widget.item.firstName,
              lastName: widget.item.lastName,
              image: widget.item.image,
              onTapToBack: () {
                var blocked = locator.get<ProfileCubit>().state.whenOrNull(
                          received: (user) => user.blockedUsersId.contains(
                            int.parse(widget.item.id),
                          ),
                        ) ??
                    false;
                Navigator.of(context).pop(blocked);
              },
            ),
          ),
        )
        .then((value) => context.read<UserBlockedCubit>().getBlockedIds());
  }

  bool _followingContains() =>
      (widget.myFollowers?.following ?? []).contains(int.parse(widget.item.id));

  bool _followersContains() =>
      (widget.myFollowers?.followers ?? []).contains(int.parse(widget.item.id));
}
