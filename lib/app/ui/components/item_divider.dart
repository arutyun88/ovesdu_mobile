import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({
    Key? key,
    this.padding,
    this.color,
  }) : super(key: key);

  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: color ?? AppColors.orange,
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
