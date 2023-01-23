import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';

class MainAppBarSubmenuWidget extends StatelessWidget {
  const MainAppBarSubmenuWidget({
    Key? key,
    required this.appBarSubmenuHeight,
    required this.typeValues,
    required this.selectedType,
    required this.selectedTypeOnTap,
  }) : super(key: key);

  final double appBarSubmenuHeight;
  final List<String> typeValues;
  final int selectedType;
  final Function(int) selectedTypeOnTap;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Material(
      color: theme.backgroundColor,
      elevation: 2.0,
      child: SizedBox(
        height: appBarSubmenuHeight,
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                  typeValues.length,
                  (index) => _TypeItem(
                    value: typeValues[index],
                    selected: selectedType == index,
                    onTap: () => selectedTypeOnTap(index),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TypeItem extends StatelessWidget {
  const _TypeItem({
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
