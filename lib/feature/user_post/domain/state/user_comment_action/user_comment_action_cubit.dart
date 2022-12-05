import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../app/domain/entities/error_entity/error_entity.dart';
import '../../entity/user_post_comment/user_post_comment_entity.dart';
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

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserCommentActionState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
