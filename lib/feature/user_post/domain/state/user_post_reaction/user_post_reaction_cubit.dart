import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../app/domain/entities/error_entity/error_entity.dart';
import '../../entity/reaction_type.dart';
import '../../user_post_repository.dart';

part 'user_post_reaction_state.dart';

part 'user_post_reaction_cubit.freezed.dart';

@Singleton()
class UserPostReactionCubit extends Cubit<UserPostReactionState> {
  UserPostReactionCubit(UserPostRepository userPostRepository)
      : _userPostRepository = userPostRepository,
        super(UserPostReactionState.init());

  final UserPostRepository _userPostRepository;

  Future<void> updatePostReaction({
    required int id,
    required ReactionType type,
  }) async {
    emit(UserPostReactionState.waiting());
    try {
      final result = await _userPostRepository.updatePostReaction(id, type);
      if (result == ReactionType.like) {
        emit(UserPostReactionState.liked());
      } else if (result == ReactionType.dislike) {
        emit(UserPostReactionState.disliked());
      } else {
        emit(UserPostReactionState.none());
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserPostReactionState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
