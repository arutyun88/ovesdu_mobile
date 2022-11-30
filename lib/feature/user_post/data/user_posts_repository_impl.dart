import 'package:injectable/injectable.dart';

import '../../../app/domain/app_api.dart';
import '../domain/entity/reaction_type.dart';
import '../domain/entity/user_post/user_posts_entity.dart';
import '../domain/user_post_repository.dart';
import 'dto/user_post/user_posts_dto.dart';

@Injectable(as: UserPostRepository)
class UserPostRepositoryImpl implements UserPostRepository {
  final AppApi _api;

  UserPostRepositoryImpl(AppApi api) : _api = api;

  @override
  Future<UserPostsEntity> getUserPosts(int id, int limit, int last) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getUserPosts(id, limit, last);

      final data = response.data['data'];

      return UserPostsDto.fromJson(data).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ReactionType> updatePostReaction(int id, ReactionType type) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.updatePostReaction(id, type.name);

      final data = response.data['data'];

      return mapToReactionType(data['type']);
    } catch (_) {
      rethrow;
    }
  }
}
