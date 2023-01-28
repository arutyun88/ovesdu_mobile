import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/helpers/app_icons.dart';
import '../../../../../app/helpers/date_helper.dart';
import '../../../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../../../../../app/ui/components/dialog/more_menu_dialog.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../message_button.dart';
import 'head_sliver_delegate.dart';

const _animationDuration = kThemeAnimationDuration;

class ReceivedWidget extends StatefulWidget {
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
  State<ReceivedWidget> createState() => _ReceivedWidgetState();
}

class _ReceivedWidgetState extends State<ReceivedWidget> {
  late ThemeData theme;
  late bool avatar;
  late AppLocalizations dictionary;
  late String lastVisit;
  late bool isOnline;
  final moreKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
    avatar = Provider.of<SettingProvider>(context).isCircleAvatar;
    dictionary = AppLocalizations.of(context)!;
    lastVisit = DateHelper.wasOnline(context, widget.receivedUser.lastVisit);
    isOnline = DateHelper.isOnline(widget.receivedUser.lastVisit);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.receivedUser.image != null
            ? Image.network(
                widget.receivedUser.image!,
                width: MediaQuery.of(context).size.width,
                height: widget.expandedHeight,
                fit: BoxFit.cover,
              )
            : Container(
                color: AppColors.hintTextColor.withOpacity(.2),
                height: widget.expandedHeight,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  AppIcons.profileIcon,
                  color: AppColors.hintTextColor,
                ),
              ),
        Positioned(
          top: widget.top >= 0 ? widget.top : 0.0,
          child: AnimatedContainer(
            duration: _animationDuration,
            curve: Curves.ease,
            width: MediaQuery.of(context).size.width,
            height: titleMaxHeight,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: widget.zero > widget.paddingTop + 100
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
                  top: widget.zero < 220 ? widget.paddingTop + 4.0 : 16.0,
                  left: widget.zero < 220 ? 128.0 : 24.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.receivedUser.firstName,
                        style: theme.textTheme.headline5,
                      ),
                      Text(
                        widget.receivedUser.lastName,
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
                    opacity: widget.zero < 220 ? 0.0 : 1.0,
                    curve: Curves.ease,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.receivedUser.city}, ${widget.receivedUser.country}',
                          style: theme.textTheme.bodyText2,
                        ),
                        Text(
                          ageCalculatedTitle(
                            context,
                            widget.receivedUser.dateOfBirth,
                          ),
                          style: theme.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: _animationDuration,
                  curve: Curves.ease,
                  top: widget.zero < 220 ? widget.paddingTop + 0.0 : 24.0,
                  right: widget.zero > 220 ? 16.0 : 24.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 3.5),
                    child: Text(
                      lastVisit,
                      maxLines: 2,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: isOnline
                            ? AppColors.orange
                            : AppColors.hintTextColor,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: widget.paddingTop + 4,
                  left: 52,
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: widget.zero > 220 ? 0.0 : 1.0,
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
                          color: AppColors.hintTextColor.withOpacity(.1),
                          border: Border.all(
                            color: isOnline
                                ? AppColors.orange
                                : AppColors.hintTextColor,
                            width: 2,
                            strokeAlign: StrokeAlign.outside,
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: widget.receivedUser.image != null
                            ? Image.network(
                                widget.receivedUser.image ?? '',
                                fit: BoxFit.cover,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SvgPicture.asset(
                                  AppIcons.profileIcon,
                                  color: AppColors.hintTextColor,
                                ),
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
                    opacity: widget.zero < 220 ? 0.0 : 1.0,
                    curve: Curves.ease,
                    child: const MessageButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: widget.paddingTop + 24,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:
                      widget.onTapToBack ?? () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppColors.orange,
                  ),
                ),
                GestureDetector(
                  key: moreKey,
                  onTap: _moreOnPressed,
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
            color: widget.zero >= 120
                ? AppColors.transparent
                : AppColors.orange.withOpacity(.2),
          ),
        ),
      ],
    );
  }

  void _moreOnPressed() {
    MoreMenuDialog.show(
      context,
      moreKey,
      actions: [
        {
          dictionary.blockUser: () {
            Navigator.of(context).pop();
            widget.blockedOnTap();
          }
        },
        {
          dictionary.subscribe: () {
            Navigator.of(context).pop();
            CustomDialog.showMessageDialog(
              context,
              dictionary.inDeveloping,
            );
          }
        },
      ],
    );
  }
}
