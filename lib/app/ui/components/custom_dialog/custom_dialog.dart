import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../const/const.dart';
import '../../../data/setting_provider/theme_provider.dart';
import '../../config/app_colors.dart';
import '../buttons/empty_button.dart';

abstract class CustomDialog {
  static Future<dynamic> showBlockDialog(BuildContext context) {
    final barrierColor = Provider.of<ThemeProvider>(context, listen: false)
        .themeData
        .backgroundColor
        .withOpacity(.7);

    return showDialog(
      context: context,
      barrierColor: barrierColor,
      builder: (context) => const _BlockDialog(),
    );
  }
}

class _BlockDialog extends StatelessWidget {
  const _BlockDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final dictionary = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(mainPadding),
            boxShadow: const [
              BoxShadow(color: AppColors.hintTextColor, blurRadius: 5.0),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: mainPadding,
                ),
                child: Column(
                  children: [
                    Text(
                      dictionary.sureWantToBlock,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline6,
                    ),
                    const SizedBox(height: mainPadding),
                    Text(
                      dictionary.wontSeePage,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: mainPadding / 2),
              Container(
                color: theme.hintColor.withOpacity(.1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmptyButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          dictionary.cancel,
                          style: theme.textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: verticalPadding),
                      EmptyButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(
                          dictionary.block,
                          style: theme.textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
