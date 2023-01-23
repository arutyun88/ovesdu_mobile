import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/domain/entities/comment_entity/post_comment_entity.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/state/user_post_comment/user_post_comment_cubit.dart';
import 'user_comment_item.dart';

class UserCommentList extends StatelessWidget {
  const UserCommentList({
    Key? key,
    required this.onTapToSelect,
    required this.onTapToRead,
  }) : super(key: key);

  final Function(PostCommentEntity?) onTapToSelect;
  final Function(
    PostCommentEntity editingComment,
    PostCommentEntity? replyTo,
  ) onTapToRead;

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;

    return BlocBuilder<UserPostCommentCubit, UserPostCommentState>(
      builder: (context, state) {
        return state.maybeWhen(
          received: (comments) {
            return Column(
              children: List.generate(
                comments.comments.length,
                (index) {
                  final replyComment = comments.comments[index].toCommentId;
                  PostCommentEntity? replyToComment;
                  String? replyToCommentText;
                  String? replyToCommentAuthor;
                  if (replyComment != null) {
                    final tempList = comments.comments
                        .where(
                          (element) => element.id == replyComment,
                        )
                        .toList();
                    if (tempList.isEmpty) {
                      final list = comments.commentsResponses
                          .where((element) => element.id == replyComment)
                          .toList();
                      if (list.isEmpty) {
                        replyToComment = null;
                        replyToCommentText = dictionary.commentDeleted;
                        replyToCommentAuthor = null;
                      } else {
                        replyToComment = list.first;
                        replyToCommentText = list.first.text;
                        replyToCommentAuthor = list.first.author.firstName;
                      }
                    } else {
                      replyToComment = tempList.first;
                      replyToCommentText = tempList.first.text;
                      replyToCommentAuthor = tempList.first.author.firstName;
                    }
                  }

                  return GestureDetector(
                    onTap: () => onTapToSelect(comments.comments[index]),
                    child: UserCommentItem(
                      comments.comments[index],
                      replyToComment: replyToComment,
                      replyToCommentText: replyToCommentText,
                      replyToCommentAuthor: replyToCommentAuthor,
                      key: ValueKey(comments.comments[index]),
                      onTapToRead: onTapToRead,
                    ),
                  );
                },
              ),
            );
          },
          orElse: () => Column(
            children: List.generate(
              3,
              (index) => Container(
                height: 100,
                width: 100,
                color: AppColors.hintTextColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
