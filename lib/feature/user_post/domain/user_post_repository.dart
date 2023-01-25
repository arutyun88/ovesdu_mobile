import 'package:domain/domain.dart';
import 'package:ovesdu_mobile/feature/user_post/domain/entity/reaction_type.dart';

abstract class UserPostRepository {
  Future<PostsEntity> getUserPosts(int id, int limit, int last);

  Future<PostEntity> getUserPost(int id);

  Future<ReactionType> updatePostReaction(int id, ReactionType type);

  Future<PostCommentEntity> createPostComment(
    int postId,
    String text, {
    int? toCommentId,
  });

  Future<PostCommentsEntity> getPostComments(
    int postId,
    int limit,
    int last,
  );

  Future<ReactionType> updateCommentReaction(int id, ReactionType type);

  Future<void> deleteComment(int id);

  Future<PostCommentEntity> updateComment(
    int commentId,
    String text,
    int postId, {
    int? toCommentId,
  });
}
