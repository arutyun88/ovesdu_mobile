import 'entity/reaction_type.dart';
import 'entity/user_post/user_posts_entity.dart';
import 'entity/user_post_comment/user_post_comment_entity.dart';

abstract class UserPostRepository {
  Future<UserPostsEntity> getUserPosts(int id, int limit, int last);

  Future<ReactionType> updatePostReaction(int id, ReactionType type);

  Future<UserPostCommentEntity> createPostComment(
    int postId,
    String text, {
    int? toCommentId,
  });
}
