part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  factory PostState.init() = _PostStateInit;

  factory PostState.waiting() = _PostStateWaiting;

  factory PostState.received(PostsEntity postsEntity) = _PostStateReceived;

  factory PostState.error(ErrorEntity error) = _PostStateError;
}
