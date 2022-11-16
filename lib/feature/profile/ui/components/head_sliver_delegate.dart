import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/date_helper.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/entities/user_profile/user_profile_entity.dart';
import 'message_button.dart';

class HeadSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String url;
  final UserProfileEntity? entity;

  HeadSliverDelegate(this.expandedHeight, this.url, this.entity);

  final double titleMinHeight = 120.0;
  final double titleMaxHeight = 140.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final dictionary = AppLocalizations.of(context)!;

    final top = expandedHeight - titleMaxHeight - shrinkOffset;
    final paddingTop = MediaQuery.of(context).padding.top;

    final percent = shrinkOffset / expandedHeight * 2;

    final nameLeftPosition = (120.0 * percent).clamp(24.0, 120.0);
    final nameTopPosition =
        ((paddingTop + 12) * percent).clamp(16.0, paddingTop + 6);

    final followRightPosition =
        ((paddingTop + 51) * percent).clamp(24.0, (paddingTop + 51));
    final followTopPosition = (24.0 * (1 - percent)).clamp(16.0, 24.0);

    final followMaxSize = theme.textTheme.headline6?.fontSize ?? 20;
    final followMinSize = theme.textTheme.bodyText2?.fontSize ?? 14;
    final followSize =
        (followMaxSize * (1 - percent)).clamp(followMinSize, followMaxSize);

    final avatarLeftPosition = (-70.0 * ((1 - percent) * 3)).clamp(-70.0, 52.0);

    final messageButtonRightPosition =
        (16.0 * ((1 - percent))).clamp(-70.0, 16.0);

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
            height: titleMaxHeight,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(mainPadding),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: nameTopPosition,
                  left: nameLeftPosition,
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
                  child: Opacity(
                    opacity: (1 - percent).clamp(0.0, 1.0),
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
                Positioned(
                  top: followRightPosition,
                  right: followTopPosition,
                  child: Text(
                    dictionary.unsubscribe,
                    style: theme.textTheme.headline6?.copyWith(
                      color: AppColors.hintTextColor,
                      fontSize: followSize,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  right: messageButtonRightPosition,
                  child: Opacity(
                    opacity: (1 - percent).clamp(0.0, 1.0),
                    child: const MessageButton(),
                  ),
                ),
                Positioned(
                  top: paddingTop + 4,
                  left: avatarLeftPosition,
                  child: Opacity(
                    opacity: ((percent - 1) * 4).clamp(0.0, 1.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(url),
                      radius: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 24,
          child: SafeArea(
            bottom: false,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
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
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => titleMinHeight;

  @override
  bool shouldRebuild(covariant oldDelegate) => false;
}
