import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../app/domain/entities/error_entity/error_entity.dart';
import '../../entity/user_post_comment/user_post_comment_entity.dart';
import '../../user_post_repository.dart';

part 'user_post_comment_state.dart';

part 'user_post_comment_cubit.freezed.dart';

@Singleton()
class UserPostCommentCubit extends Cubit<UserPostCommentState> {
  UserPostCommentCubit(UserPostRepository userPostRepository)
      : _userPostRepository = userPostRepository,
        super(UserPostCommentState.init());

  final UserPostRepository _userPostRepository;

  Future<void> createPostComment({
    required int postId,
    required String text,
    int? toCommentId,
  }) async {
    emit(UserPostCommentState.creating());
    try {
      final result = await _userPostRepository.createPostComment(
        postId,
        text,
        toCommentId: toCommentId,
      );
      emit(UserPostCommentState.created(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }
}
