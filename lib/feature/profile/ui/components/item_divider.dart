import 'package:flutter/material.dart';

import '../../../../app/ui/config/app_colors.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({
    Key? key,
    this.padding,
  }) : super(key: key);

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: AppColors.orange,
        height: 0.3,
      ),
    );
  }
}

class VerticalItemDivider extends StatelessWidget {
  const VerticalItemDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: AppColors.orange,
        width: 0.1,
      ),
    );
  }
}
