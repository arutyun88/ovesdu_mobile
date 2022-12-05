import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/domain/entities/error_entity/error_entity.dart';
import '../entity/user_post/user_post_entity.dart';
import '../entity/user_post/user_posts_entity.dart';
import '../user_post_repository.dart';

part 'user_post_state.dart';

part 'user_post_cubit.freezed.dart';

@Singleton()
class UserPostCubit extends Cubit<UserPostState> {
  UserPostCubit(UserPostRepository userPostRepository)
      : _userPostRepository = userPostRepository,
        super(UserPostState.init());

  final UserPostRepository _userPostRepository;

  Future<void> getUserPosts({
    required int id,
    required int limit,
    required int last,
  }) async {
    emit(UserPostState.waiting());
    try {
      final result = await _userPostRepository.getUserPosts(id, limit, last);
      emit(UserPostState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> getUserPost(int id) async {
    try {
      final result = await _userPostRepository.getUserPost(id);
      emit(UserPostState.updated(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  void updateComments(ActionType type) {
    try {
      state.whenOrNull(updated: (post) {
        late UserPostEntity copy;
        switch (type) {
          case ActionType.add:
            copy = post.copyWith(comment: post.comment + 1);
            break;
          case ActionType.remove:
            copy = post.copyWith(comment: post.comment - 1);
            break;
        }
        emit(UserPostState.updated(copy));
      });
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserPostState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}

enum ActionType { add, remove }
