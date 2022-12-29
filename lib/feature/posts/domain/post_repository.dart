import '../../user_post/domain/entity/user_post/user_posts_entity.dart';
import 'entity/timeline_type.dart';

abstract class PostRepository {
  Future<UserPostsEntity> getPosts(TimelineType type, int limit, int last);
}
