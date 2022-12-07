import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../app/domain/entities/error_entity/error_entity.dart';
import '../../entity/user_post_comment/user_post_comment_entity.dart';
import '../../entity/user_post_comment/user_post_comments_entity.dart';
import '../../user_post_repository.dart';

part 'user_post_comment_state.dart';

part 'user_post_comment_cubit.freezed.dart';

@Singleton()
class UserPostCommentCubit extends Cubit<UserPostCommentState> {
  UserPostCommentCubit(UserPostRepository userPostRepository)
      : _userPostRepository = userPostRepository,
        super(UserPostCommentState.init());

  final UserPostRepository _userPostRepository;

  Future<void> getPostComments({
    required int postId,
    required int limit,
    required int last,
  }) async {
    emit(UserPostCommentState.waiting());
    try {
      final result = await _userPostRepository.getPostComments(
        postId,
        limit,
        last,
      );
      emit(UserPostCommentState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  void commentAdded(UserPostCommentEntity comment) {
    try {
      state.whenOrNull(received: (comments) {
        final newList = <UserPostCommentEntity>[];
        newList.add(comment);
        newList.addAll(comments.comments);
        final result = comments.copyWith(comments: newList);
        emit(UserPostCommentState.received(result));
      });
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  void commentUpdated(UserPostCommentEntity updatedComment) {
    try {
      state.whenOrNull(received: (comments) {
        final newList = <UserPostCommentEntity>[];
        for (UserPostCommentEntity comment in comments.comments) {
          if (comment.id == updatedComment.id) {
            newList.add(updatedComment);
          } else {
            newList.add(comment);
          }
        }
        final result = comments.copyWith(comments: newList);
        emit(UserPostCommentState.received(result));
      });
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  void commentDeleted(Set<int> ids) {
    try {
      state.whenOrNull(received: (comments) {
        var newList =
            comments.comments.where((e) => !ids.contains(e.id)).toList();
        final result = comments.copyWith(comments: newList);
        emit(UserPostCommentState.received(result));
      });
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserPostCommentState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
