import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import '../../../domain/state/user_post_comment/user_post_comment_cubit.dart';
import 'user_comment_item.dart';

class UserCommentList extends StatelessWidget {
  const UserCommentList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostCommentCubit, UserPostCommentState>(
      builder: (context, state) {
        return state.maybeWhen(
          received: (comments) {
            return Column(
              children: List.generate(
                comments.comments.length,
                (index) {
                  final replyComment = comments.comments[index].toCommentId;
                  UserPostCommentEntity? reply;
                  if (replyComment != null) {
                    final tempList = comments.comments
                        .where(
                          (element) => element.id == replyComment,
                        )
                        .toList();
                    if (tempList.isEmpty) {
                      reply = comments.commentsResponses
                          .firstWhere((element) => element.id == replyComment);
                    } else {
                      reply = tempList.first;
                    }
                  }

                  return UserCommentItem(
                    comments.comments[index],
                    replyToComment: reply,
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
