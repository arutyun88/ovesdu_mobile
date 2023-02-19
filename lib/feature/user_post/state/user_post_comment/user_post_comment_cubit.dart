import 'package:domain/domain.dart';
import 'package:domain/entity/error_entity/error_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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

  Future<void> addPostComments({
    required int postId,
    required int limit,
    required int last,
  }) async {
    try {
      final result = await _userPostRepository.getPostComments(
        postId,
        limit,
        last,
      );

      state.whenOrNull(
        received: (receivedComments) {
          final oldComments = receivedComments.comments.map((e) => e).toList();
          final oldResponses =
              receivedComments.commentsResponses.map((e) => e).toList();
          oldComments.addAll(result.comments);
          oldResponses.addAll(result.commentsResponses);
          final newResult = result.copyWith(
            comments: oldComments,
            commentsResponses: oldResponses,
          );

          emit(UserPostCommentState.received(newResult));
        },
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  void commentAdded(PostCommentEntity comment) {
    try {
      state.whenOrNull(received: (comments) {
        final newList = <PostCommentEntity>[];
        newList.add(comment);
        newList.addAll(comments.comments);
        final result = comments.copyWith(comments: newList);
        emit(UserPostCommentState.received(result));
      });
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  void commentUpdated(PostCommentEntity updatedComment) {
    try {
      state.whenOrNull(received: (comments) {
        final newList = <PostCommentEntity>[];
        for (PostCommentEntity comment in comments.comments) {
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
