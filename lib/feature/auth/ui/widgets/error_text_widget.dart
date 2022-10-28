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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              errorText,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 14.0, color: AppColors.red),
            ),
          ),
        ),
      ],
    );
  }
}
