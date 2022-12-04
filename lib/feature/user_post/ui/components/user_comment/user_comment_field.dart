import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../../app/ui/components/text_fields/app_multiline_text_field.dart';
import '../../../../../app/ui/config/app_colors.dart';

class UserCommentField extends StatefulWidget {
  const UserCommentField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.sendOnPressed,
    required this.actionHeight,
    required this.symbolCount,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? sendOnPressed;
  final double actionHeight;
  final int symbolCount;

  @override
  State<UserCommentField> createState() => _UserCommentFieldState();
}

class _UserCommentFieldState extends State<UserCommentField> {
  late ThemeData theme;
  late AppLocalizations dictionary;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context, listen: false).themeData;
    dictionary = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: theme.backgroundColor,
          padding: const EdgeInsets.all(verticalPadding),
          child: AppMultilineTextField(
            hintText: dictionary.commentHint,
            maxLines: 7,
            controller: widget.controller,
            onChanged: widget.onChanged,
          ),
        ),
        Container(
          color: theme.backgroundColor,
          height: widget.actionHeight,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: mainPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: widget.symbolCount != 0
                    ? Text(
                        '${widget.symbolCount} ${dictionary.symbols}',
                        style: theme.textTheme.bodyText2?.copyWith(
                          color: AppColors.hintTextColor,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    : Text(
                        dictionary.commentReply,
                        maxLines: 2,
                        style: theme.textTheme.bodyText2?.copyWith(
                          color: AppColors.hintTextColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: mainPadding),
                child: EmptyButton(
                  onPressed: widget.sendOnPressed,
                  child: const Icon(
                    Icons.send,
                    size: iconSize,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
