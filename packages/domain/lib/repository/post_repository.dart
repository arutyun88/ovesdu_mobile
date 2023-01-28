import 'package:domain/entity/post_entity/posts_entity.dart';
import 'package:domain/entity/timeline_type.dart';

abstract class PostRepository {
  Future<PostsEntity> getPosts(TimelineType type, int limit, int last);
}
