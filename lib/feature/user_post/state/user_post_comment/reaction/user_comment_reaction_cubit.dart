import 'package:domain/domain.dart';
import 'package:domain/entity/error_entity/error_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/entity/reaction_type.dart';


part 'user_comment_reaction_state.dart';

part 'user_comment_reaction_cubit.freezed.dart';

@Singleton()
class UserCommentReactionCubit extends Cubit<UserCommentReactionState> {
  UserCommentReactionCubit(UserPostRepository userPostRepository)
      : _userPostRepository = userPostRepository,
        super(UserCommentReactionState.init());

  final UserPostRepository _userPostRepository;

  Future<void> updateCommentReaction({
    required int id,
    required ReactionType type,
  }) async {
    emit(UserCommentReactionState.waiting());
    try {
      final result = await _userPostRepository.updateCommentReaction(id, type);
      if (result == ReactionType.like) {
        emit(UserCommentReactionState.liked());
      } else if (result == ReactionType.dislike) {
        emit(UserCommentReactionState.disliked());
      } else {
        emit(UserCommentReactionState.none());
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserCommentReactionState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
