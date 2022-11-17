import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/const/const.dart';
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

  HeadSliverDelegate(this.expandedHeight, this.url, this.entity);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final dictionary = AppLocalizations.of(context)!;

    final paddingTop = MediaQuery.of(context).padding.top;

    final zero = expandedHeight - shrinkOffset;
    final top = zero - _titleMaxHeight;

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
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(url),
                      radius: 30.0,
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
                : AppColors.hintTextColor.withOpacity(.3),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => _titleMinHeight;

  @override
  bool shouldRebuild(covariant oldDelegate) => false;
}
