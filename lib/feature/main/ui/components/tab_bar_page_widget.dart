import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/app_icons.dart';
import '../../../../app/ui/config/app_colors.dart';

class TabBarPageWidget extends StatelessWidget {
  const TabBarPageWidget({
    Key? key,
    required this.tabBarHeight,
    required this.tabBarItemOnTap,
    required this.selectedPage,
  }) : super(key: key);

  final double tabBarHeight;
  final Function(int) tabBarItemOnTap;
  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Column(
      children: [
        Container(
          height: tabBarHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                offset: const Offset(0, -2),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => tabBarItemOnTap(0),
                child: SvgPicture.asset(
                  AppIcons.timelineIcon,
                  height: iconSize,
                  width: iconSize,
                  color: selectedPage == 0
                      ? AppColors.orange
                      : AppColors.hintTextColor,
                ),
              ),
              GestureDetector(
                onTap: () => tabBarItemOnTap(1),
                child: SvgPicture.asset(
                  AppIcons.messageIcon,
                  height: iconSize,
                  width: iconSize,
                  color: selectedPage == 1
                      ? AppColors.orange
                      : AppColors.hintTextColor,
                ),
              ),
              GestureDetector(
                onTap: () => tabBarItemOnTap(2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: SvgPicture.asset(
                    AppIcons.moreIcon,
                    height: iconSize - 4,
                    width: iconSize,
                    color: selectedPage == 2
                        ? AppColors.orange
                        : AppColors.hintTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
