import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';

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
          child: Container(
            height: 24,
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              errorText,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .apply(color: AppColors.red),
            ),
          ),
        ),
      ],
    );
  }
}
