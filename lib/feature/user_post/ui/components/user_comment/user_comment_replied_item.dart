import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/ui/components/item_divider.dart';
import '../../../../../app/ui/config/app_colors.dart';

class UserCommentRepliedItem extends StatelessWidget {
  const UserCommentRepliedItem({
    Key? key,
    required this.replyToCommentAuthor,
    required this.replyToCommentText,
  }) : super(key: key);

  final String? replyToCommentAuthor;
  final String? replyToCommentText;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final dictionary = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: verticalPadding * 2,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: verticalPadding * 2,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.hintTextColor.withOpacity(.07),
          borderRadius: BorderRadius.circular(mainRadius / 3),
          border: Border.all(
            width: 1,
            color: AppColors.hintTextColor.withOpacity(.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (replyToCommentAuthor != null)
              Text(
                dictionary.responseToComment(replyToCommentAuthor ?? ''),
                style: theme.textTheme.bodyText2?.copyWith(
                  color: AppColors.hintTextColor,
                ),
              ),
            if (replyToCommentAuthor != null)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                child: ItemDivider(
                  padding: EdgeInsets.zero,
                  color: AppColors.hintTextColor,
                ),
              ),
            Text(
              replyToCommentText ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyText2?.copyWith(
                color: replyToCommentAuthor == null
                    ? AppColors.hintTextColor.withOpacity(.9)
                    : theme.textTheme.bodyText2?.color,
                fontStyle: replyToCommentAuthor == null
                    ? FontStyle.italic
                    : FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
