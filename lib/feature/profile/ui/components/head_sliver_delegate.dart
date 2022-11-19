import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/date_helper.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/entities/user_profile/user_profile_entity.dart';
import 'message_button.dart';

const _animationDuration = kThemeAnimationDuration;
const _titleMinHeight = 120.0;
const _titleMaxHeight = 140.0;

class HeadSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String url;
  final UserProfileEntity? entity;
  final ValueNotifier<bool> received;

  HeadSliverDelegate(this.expandedHeight, this.url, this.entity, this.received);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final dictionary = AppLocalizations.of(context)!;
    final avatar = Provider.of<SettingProvider>(context).isCircleAvatar;

    final paddingTop = MediaQuery.of(context).padding.top;

    final zero = expandedHeight - shrinkOffset;
    final top = zero - _titleMaxHeight;

    return ValueListenableBuilder<bool>(
      valueListenable: received,
      builder: (context, value, child) {
        return Stack(
          children: [
            ImageFiltered(
              enabled: !value,
              imageFilter: ImageFilter.blur(sigmaX: 25.0),
              child: Image.network(
                url,
                width: MediaQuery.of(context).size.width,
                height: expandedHeight,
                fit: BoxFit.cover,
              ),
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
                          Text(entity?.firstName ?? '',
                              style: theme.textTheme.headline5),
                          Text(entity?.lastName ?? '',
                              style: theme.textTheme.headline6),
                        ],
                      ),
                    ),
                    if (value)
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
                                '${entity?.city ?? ''}, ${entity?.country ?? ''}',
                                style: theme.textTheme.bodyText2,
                              ),
                              Text(
                                '${ageCalculatedTitle(
                                  context,
                                  entity?.dateOfBirth ?? DateTime.now(),
                                )} / ${entity?.isMale ?? true ? dictionary.unmarriedM : dictionary.unmarriedW}',
                                style: theme.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (value)
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
                    if (value)
                      Positioned(
                        top: paddingTop + 4,
                        left: 52,
                        child: AnimatedOpacity(
                          duration: _animationDuration,
                          opacity: zero > 220 ? 0.0 : 1.0,
                          curve: Curves.ease,
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<SettingProvider>(context,
                                      listen: false)
                                  .setCircleAvatar();
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: avatar
                                    ? BoxShape.circle
                                    : BoxShape.rectangle,
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
                    if (value)
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
                    if (value)
                      const Center(
                        child: Icon(
                          Icons.more_horiz,
                          size: 24,
                          color: AppColors.orange,
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
            )
          ],
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
