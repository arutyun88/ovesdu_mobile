import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/helpers/app_icons.dart';
import '../../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../../app/ui/components/text_fields/app_multiline_text_field.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import 'user_comment_replied_item.dart';

class UserCommentField extends StatefulWidget {
  const UserCommentField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.sendOnPressed,
    required this.actionHeight,
    required this.symbolCount,
    this.replyToComment,
    required this.onTapToUnselect,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? sendOnPressed;
  final double actionHeight;
  final int symbolCount;
  final UserPostCommentEntity? replyToComment;
  final Function(UserPostCommentEntity?) onTapToUnselect;

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
          child: Column(
            children: [
              if (widget.replyToComment?.text != null)
                Stack(
                  children: [
                    UserCommentRepliedItem(
                      replyToCommentAuthor:
                          widget.replyToComment?.author.firstName,
                      replyToCommentText: widget.replyToComment?.text,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: SizedBox(
                        height: iconSize,
                        width: iconSize,
                        child: GestureDetector(
                          onTap: () => widget.onTapToUnselect(null),
                          child: SvgPicture.asset(
                            AppIcons.cancelIcon,
                            color: theme.textTheme.bodyText2?.color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              AppMultilineTextField(
                hintText: dictionary.commentHint,
                maxLines: widget.replyToComment?.text != null ? 3 : 7,
                controller: widget.controller,
                onChanged: widget.onChanged,
              ),
            ],
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
