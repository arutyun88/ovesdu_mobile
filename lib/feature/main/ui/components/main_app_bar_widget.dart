import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/app_icons.dart';
import '../../../../app/ui/config/app_colors.dart';
import 'app_bar_logo_widget.dart';
import 'app_bar_page_widget.dart';

class MainAppBarWidget extends StatelessWidget {
  const MainAppBarWidget({
    Key? key,
    required this.appBarHeight,
    required this.title,
  }) : super(key: key);

  final double appBarHeight;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Material(
      color: theme.backgroundColor,
      elevation: 2.0,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: appBarHeight,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(
                        minHeight: 0.0,
                        minWidth: 0.0,
                      ),
                      splashRadius: iconSize,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      // color: AppColors.orange,
                      iconSize: iconSize,
                      icon: SvgPicture.asset(AppIcons.moreSettingIcon),
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width - iconSize - 28.0,
                      child: Row(
                        children: [
                          const AppBarLogoWidget(),
                          const Spacer(),
                          AppBarPageWidget(title: title),
                          const Icon(
                            CupertinoIcons.search,
                            size: 28.0,
                            color: AppColors.orange,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
