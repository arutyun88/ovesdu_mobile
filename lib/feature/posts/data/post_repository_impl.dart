import 'package:injectable/injectable.dart';

import '../../../app/domain/app_api.dart';
import '../../user_post/data/dto/user_post/user_posts_dto.dart';
import '../../user_post/domain/entity/user_post/user_posts_entity.dart';
import '../domain/entity/timeline_type.dart';
import '../domain/post_repository.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final AppApi _api;

  PostRepositoryImpl(AppApi api) : _api = api;

  @override
  Future<UserPostsEntity> getPosts(
    TimelineType type,
    int limit,
    int last,
  ) async {
    await _api.setHeaderLocale();

    try {
      final response = await _api.getPosts(type.name, limit, last);

      final data = response.data['data'];

      return UserPostsDto.fromJson(data).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
