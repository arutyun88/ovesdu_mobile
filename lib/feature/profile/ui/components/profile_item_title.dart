import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';

class ProfileItemTitle extends StatelessWidget {
  const ProfileItemTitle({
    Key? key,
    required this.itemTitle,
  }) : super(key: key);

  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemTitle,
            style: theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.hintTextColor,
            ),
          ),
          Text(
            dictionary.showMore,
            style: theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
