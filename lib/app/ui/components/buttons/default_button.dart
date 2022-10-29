import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/ui/config/app_colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.title,
    required this.enable,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final bool enable;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: enable ? onPressed : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.orange, width: 1.0),
          color: enable ? AppColors.orange : AppColors.orange.withOpacity(.2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(
            color:
                enable ? Theme.of(context).backgroundColor : AppColors.orange,
          ),
        ),
      ),
    );
  }
}
