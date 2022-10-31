import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/ui/config/app_colors.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: SizedBox(
            height: 32,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                errorText,
                maxLines: 1,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 14.0, color: AppColors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
