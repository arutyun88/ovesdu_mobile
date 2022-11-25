import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/helpers/date_helper.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entities/user_profile/user_profile_entity.dart';
import '../message_button.dart';
import 'head_sliver_delegate.dart';

const _animationDuration = kThemeAnimationDuration;

class ReceivedWidget extends StatelessWidget {
  const ReceivedWidget({
    Key? key,
    required this.receivedUser,
    required this.expandedHeight,
    required this.top,
    required this.zero,
    required this.paddingTop,
    required this.blockedOnTap,
    this.onTapToBack,
  }) : super(key: key);

  final UserProfileEntity receivedUser;
  final double expandedHeight;
  final double top;
  final double zero;
  final double paddingTop;
  final VoidCallback blockedOnTap;
  final VoidCallback? onTapToBack;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final avatar = Provider.of<SettingProvider>(context).isCircleAvatar;
    final dictionary = AppLocalizations.of(context)!;
    return Stack(
      children: [
        Image.network(
          receivedUser.image ?? '',
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
            height: titleMaxHeight,
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
                          receivedUser.image ?? '',
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
                  onTap: onTapToBack ?? () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppColors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: blockedOnTap,
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
