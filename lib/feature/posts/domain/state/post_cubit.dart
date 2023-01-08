import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/domain/entities/error_entity/error_entity.dart';
import '../../../../app/domain/entities/post_entity/post_entity.dart';
import '../../../../app/domain/entities/post_entity/posts_entity.dart';
import '../entity/timeline_type.dart';
import '../post_repository.dart';

part 'post_state.dart';

part 'post_cubit.freezed.dart';

@Singleton()
class PostCubit extends Cubit<PostState> {
  PostCubit(PostRepository postRepository)
      : _postRepository = postRepository,
        super(PostState.init());

  final PostRepository _postRepository;

  Future<void> getUserPosts({
    required TimelineType type,
    required int limit,
    required int last,
  }) async {
    try {
      final result = await _postRepository.getPosts(type, limit, last);
      switch (type) {
        case TimelineType.overall:
          emit(PostState.overall(result));
          break;
        case TimelineType.tags:
          emit(PostState.tags(result));
          break;
        case TimelineType.my:
          emit(PostState.my(result));
          break;
        case TimelineType.subscribe:
          emit(PostState.subscribe(result));
          break;
        case TimelineType.hot:
          emit(PostState.hot(result));
          break;
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> postUpdated(PostEntity entity) async {
    // todo
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(PostState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
