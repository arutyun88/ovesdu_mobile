import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entities/user_profile/user_profile_entity.dart';
import 'head_sliver_delegate.dart';

class OrElseWidget extends StatelessWidget {
  const OrElseWidget({
    Key? key,
    required this.expandedHeight,
    required this.top,
    required this.zero,
    required this.paddingTop,
    required this.entity,
    required this.blockedOnTap,
  }) : super(key: key);

  final double expandedHeight;
  final double top;
  final double zero;
  final double paddingTop;
  final UserProfileEntity? entity;
  final VoidCallback blockedOnTap;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          constraints: BoxConstraints(maxHeight: expandedHeight),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Image.network(
              entity?.image ?? '',
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
      ],
    );
  }
}
