import 'package:domain/entity/error_entity/error_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../app/domain/entities/comment_entity/post_comment_entity.dart';
import '../../user_post_repository.dart';

part 'user_comment_action_state.dart';

part 'user_comment_action_cubit.freezed.dart';

@Singleton()
class UserCommentActionCubit extends Cubit<UserCommentActionState> {
  UserCommentActionCubit(UserPostRepository userPostRepository)
      : _userPostRepository = userPostRepository,
        super(UserCommentActionState.init());

  final UserPostRepository _userPostRepository;

  Future<void> createComment({
    required int postId,
    required String text,
    int? toCommentId,
  }) async {
    emit(UserCommentActionState.creating());
    try {
      final result = await _userPostRepository.createPostComment(
        postId,
        text,
        toCommentId: toCommentId,
      );
      emit(UserCommentActionState.created(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> updateComment({
    required int commentId,
    required int postId,
    required String text,
    int? toCommentId,
  }) async {
    emit(UserCommentActionState.updating());
    try {
      final result = await _userPostRepository.updateComment(
        commentId,
        text,
        postId,
        toCommentId: toCommentId,
      );
      emit(UserCommentActionState.updated(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> deleteComment(int id) async {
    emit(UserCommentActionState.deleting());
    try {
      await _userPostRepository.deleteComment(id);
      emit(UserCommentActionState.deleted());
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserCommentActionState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
