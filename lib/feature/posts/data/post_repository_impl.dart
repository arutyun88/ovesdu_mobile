import 'package:injectable/injectable.dart';

import '../../../app/data/dto/post_dto/posts_dto.dart';
import '../../../app/domain/app_api.dart';
import '../../../app/domain/entities/post_entity/posts_entity.dart';
import '../domain/entity/timeline_type.dart';
import '../domain/post_repository.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final AppApi _api;

  PostRepositoryImpl(AppApi api) : _api = api;

  @override
  Future<PostsEntity> getPosts(
    TimelineType type,
    int limit,
    int last,
  ) async {
    await _api.setHeaderLocale();

    try {
      final response = await _api.getPosts(type.name, limit, last);

      final data = response.data['data'];

      return PostsDto.fromJson(data).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
