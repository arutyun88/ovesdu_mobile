import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/app_icons.dart';
import '../../../../app/helpers/date_helper.dart';
import '../../../../app/ui/config/app_colors.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({
    Key? key,
    required this.receivedUser,
    required this.height,
  }) : super(key: key);

  final UserProfileEntity receivedUser;
  final double height;

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  final moreKey = GlobalKey();
  late ThemeData theme;
  late bool avatar;
  late bool isOnline;
  late double paddingTop;
  late String lastVisit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
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
        height: widget.height,
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
                              strokeAlign: BorderSide.strokeAlignOutside,
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
}
