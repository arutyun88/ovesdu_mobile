import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';

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
                style: Provider.of<ThemeProvider>(context)
                    .themeData
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
