import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';

class PostTypeItem extends StatelessWidget {
  const PostTypeItem({
    Key? key,
    required this.value,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final String value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            color: AppColors.transparent,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12.0,
            ),
            child: Text(
              value,
              style: theme.textTheme.headline6?.copyWith(
                color: selected ? AppColors.orange : AppColors.hintTextColor,
              ),
            ),
          ),
          if (selected)
            Positioned(
              bottom: 0,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: AppColors.orange,
              ),
            ),
        ],
      ),
    );
  }
}
