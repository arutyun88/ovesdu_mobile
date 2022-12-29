import '../../../app/domain/entities/comment_entity/post_comment_entity.dart';
import '../../../app/domain/entities/comment_entity/post_comments_entity.dart';
import '../../../app/domain/entities/post_entity/post_entity.dart';
import 'entity/reaction_type.dart';
import '../../../app/domain/entities/post_entity/posts_entity.dart';

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
