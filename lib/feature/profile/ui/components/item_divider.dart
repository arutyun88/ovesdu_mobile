import 'package:flutter/material.dart';

import '../../../../app/ui/config/app_colors.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        color: AppColors.orange,
        thickness: .3,
        height: 0.3,
      ),
    );
  }
}
