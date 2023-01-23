part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  factory PostState.init() = _PostStateInit;

  factory PostState.waiting() = _PostStateWaiting;

  factory PostState.overall(PostsEntity postsEntity) = _PostStateOverall;

  factory PostState.tags(PostsEntity postsEntity) = _PostStateTags;

  factory PostState.my(PostsEntity postsEntity) = _PostStateMy;

  factory PostState.subscribe(PostsEntity postsEntity) = _PostStateSubscribe;

  factory PostState.hot(PostsEntity postsEntity) = _PostStateHot;

  factory PostState.error(ErrorEntity error) = _PostStateError;
}
