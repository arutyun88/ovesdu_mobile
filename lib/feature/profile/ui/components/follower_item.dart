import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/di/init_di.dart';
import '../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/entities/user_profile_follower/user_profile_follower_item_entity.dart';
import '../../domain/entities/user_profile_follower/user_simple_followers_entity.dart';
import '../../domain/profile_repository.dart';
import '../../domain/state/profile_cubit.dart';
import '../../domain/state/user_profile_follower/my_followers_cubit.dart';
import '../user_profile_screen.dart';
import 'item_divider.dart';

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
                                      dictionary.blocked,
                                      style: buttonStyle?.copyWith(
                                        color: AppColors.hintTextColor
                                            .withOpacity(.5),
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
                                                  dictionary.waiting,
                                                  textAlign: TextAlign.right,
                                                  style: buttonStyle?.copyWith(
                                                    fontStyle: FontStyle.italic,
                                                    color:
                                                        AppColors.hintTextColor,
                                                  ),
                                                )
                                              : Text(
                                                  dictionary.subscribed,
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
                                                      dictionary.waiting,
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
                                                      dictionary
                                                          .subscribedToYou,
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
                                                      dictionary.waiting,
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
                                                      dictionary.subscribe,
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
