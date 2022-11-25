import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/date_helper.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/entities/user_profile/user_profile_entity.dart';
import '../../domain/state/user_profile_cubit.dart';
import 'message_button.dart';

const _animationDuration = kThemeAnimationDuration;

class HeadSliverDelegate extends SliverPersistentHeaderDelegate {
  late double _titleMinHeight = 120.0;
  final _titleMaxHeight = 140.0;
  final double expandedHeight;
  final String url;
  final UserProfileEntity? entity;

  HeadSliverDelegate(
    this.expandedHeight,
    this.url,
    this.entity,
  );

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    final paddingTop = MediaQuery.of(context).padding.top;
    _titleMinHeight = paddingTop + 73;

    final zero = expandedHeight - shrinkOffset;
    final top = zero - _titleMaxHeight;

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          received: (receivedUser) => _ReceivedWidget(
            receivedUser: receivedUser,
            url: url,
            expandedHeight: expandedHeight,
            top: top,
            titleMaxHeight: _titleMaxHeight,
            theme: theme,
            zero: zero,
            paddingTop: paddingTop,
          ),
          orElse: () => _OrElseWidget(
            url: url,
            expandedHeight: expandedHeight,
            top: top,
            titleMaxHeight: _titleMaxHeight,
            theme: theme,
            zero: zero,
            paddingTop: paddingTop,
            entity: entity,
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => _titleMinHeight;

  @override
  bool shouldRebuild(covariant oldDelegate) => false;
}

class _ReceivedWidget extends StatelessWidget {
  const _ReceivedWidget({
    Key? key,
    required this.receivedUser,
    required this.url,
    required this.expandedHeight,
    required this.top,
    required double titleMaxHeight,
    required this.theme,
    required this.zero,
    required this.paddingTop,
  })  : _titleMaxHeight = titleMaxHeight,
        super(key: key);

  final UserProfileEntity receivedUser;
  final String url;
  final double expandedHeight;
  final double top;
  final double _titleMaxHeight;
  final ThemeData theme;
  final double zero;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    final avatar = Provider.of<SettingProvider>(context).isCircleAvatar;
    final dictionary = AppLocalizations.of(context)!;
    return Stack(
      children: [
        Image.network(
          url,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: top >= 0 ? top : 0.0,
          child: AnimatedContainer(
            duration: _animationDuration,
            curve: Curves.ease,
            width: MediaQuery.of(context).size.width,
            height: _titleMaxHeight,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: zero > paddingTop + 100
                  ? const BorderRadius.vertical(
                      top: Radius.circular(mainPadding),
                    )
                  : null,
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: _animationDuration,
                  curve: Curves.ease,
                  top: zero < 220 ? paddingTop + 4.0 : 16.0,
                  left: zero < 220 ? 128.0 : 24.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        receivedUser.firstName,
                        style: theme.textTheme.headline5,
                      ),
                      Text(
                        receivedUser.lastName,
                        style: theme.textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  left: 24.0,
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: zero < 220 ? 0.0 : 1.0,
                    curve: Curves.ease,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${receivedUser.city}, ${receivedUser.country}',
                          style: theme.textTheme.bodyText2,
                        ),
                        Text(
                          '${ageCalculatedTitle(
                            context,
                            receivedUser.dateOfBirth,
                          )} / ${receivedUser.isMale ? dictionary.unmarriedM : dictionary.unmarriedW}',
                          style: theme.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: _animationDuration,
                  curve: Curves.ease,
                  top: zero < 220 ? paddingTop + 4.0 : 24.0,
                  right: zero > 220 ? 16.0 : 24.0,
                  child: Text(
                    dictionary.unsubscribe,
                    style: theme.textTheme.headline6?.copyWith(
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ),
                Positioned(
                  top: paddingTop + 4,
                  left: 52,
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: zero > 220 ? 0.0 : 1.0,
                    curve: Curves.ease,
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<SettingProvider>(context, listen: false)
                            .setCircleAvatar();
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: avatar ? BoxShape.circle : BoxShape.rectangle,
                          borderRadius:
                              avatar ? null : BorderRadius.circular(16),
                          color: AppColors.hintTextColor,
                          border: Border.all(
                            color: AppColors.orange,
                            width: 2,
                            strokeAlign: StrokeAlign.outside,
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  right: 16,
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: zero < 220 ? 0.0 : 1.0,
                    curve: Curves.ease,
                    child: const MessageButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: paddingTop + 24,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppColors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Center(
                    child: Icon(
                      Icons.more_horiz,
                      size: 24,
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: AnimatedContainer(
            duration: _animationDuration * .5,
            height: 2,
            width: MediaQuery.of(context).size.width,
            color: zero >= 120
                ? AppColors.transparent
                : AppColors.hintTextColor.withOpacity(.05),
          ),
        ),
      ],
    );
  }
}

class _OrElseWidget extends StatelessWidget {
  const _OrElseWidget({
    Key? key,
    required this.url,
    required this.expandedHeight,
    required this.top,
    required double titleMaxHeight,
    required this.theme,
    required this.zero,
    required this.paddingTop,
    required this.entity,
  })  : _titleMaxHeight = titleMaxHeight,
        super(key: key);

  final String url;
  final double expandedHeight;
  final double top;
  final double _titleMaxHeight;
  final ThemeData theme;
  final double zero;
  final double paddingTop;
  final UserProfileEntity? entity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          constraints: BoxConstraints(maxHeight: expandedHeight),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Image.network(
              url,
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: top,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: _titleMaxHeight,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(mainPadding),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 16.0,
                  left: 24.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity?.firstName ?? '',
                        style: theme.textTheme.headline5,
                      ),
                      Text(
                        entity?.lastName ?? '',
                        style: theme.textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: paddingTop + 24,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppColors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Center(
                    child: Icon(
                      Icons.more_horiz,
                      size: 24,
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
