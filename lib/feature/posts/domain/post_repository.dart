import 'package:domain/domain.dart';

import 'entity/timeline_type.dart';

abstract class PostRepository {
  Future<PostsEntity> getPosts(TimelineType type, int limit, int last);
}
