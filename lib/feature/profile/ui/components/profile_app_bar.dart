import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/app_actions.dart';
import '../../../../app/helpers/app_icons.dart';
import '../../../../app/helpers/date_helper.dart';
import '../../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../../../../app/ui/components/dialog/more_menu_dialog.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/entities/user_profile/user_profile_entity.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({
    Key? key,
    required this.receivedUser,
  }) : super(key: key);

  final UserProfileEntity receivedUser;

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  final double titleHeight = 120.0;
  final moreKey = GlobalKey();
  late ThemeData theme;
  late AppLocalizations dictionary;
  late bool avatar;
  late bool isOnline;
  late double paddingTop;
  late String lastVisit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
    dictionary = AppLocalizations.of(context)!;
    avatar = Provider.of<SettingProvider>(context).isCircleAvatar;
    isOnline = DateHelper.isOnline(widget.receivedUser.lastVisit);
    paddingTop = MediaQuery.of(context).padding.top;
    lastVisit = DateHelper.wasOnline(context, widget.receivedUser.lastVisit);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        color: theme.backgroundColor,
        height: titleHeight,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: paddingTop),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    top: 4.0,
                    right: 24.0,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape:
                                avatar ? BoxShape.circle : BoxShape.rectangle,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: GestureDetector(
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
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 24.0,
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
              ],
            ),
          ],
        ),
      ),
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
            AppActions.blockedOnTap(context, widget.receivedUser.id);
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
