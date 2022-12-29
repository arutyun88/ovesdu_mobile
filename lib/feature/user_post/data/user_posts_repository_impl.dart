import 'package:injectable/injectable.dart';

import '../../../app/data/dto/post_comment_dto/post_comment_dto.dart';
import '../../../app/data/dto/post_comment_dto/post_comments_dto.dart';
import '../../../app/data/dto/post_dto/post_dto.dart';
import '../../../app/data/dto/post_dto/posts_dto.dart';
import '../../../app/domain/app_api.dart';
import '../../../app/domain/entities/comment_entity/post_comment_entity.dart';
import '../../../app/domain/entities/comment_entity/post_comments_entity.dart';
import '../../../app/domain/entities/post_entity/post_entity.dart';
import '../domain/entity/reaction_type.dart';
import '../../../app/domain/entities/post_entity/posts_entity.dart';
import '../domain/user_post_repository.dart';

@Injectable(as: UserPostRepository)
class UserPostRepositoryImpl implements UserPostRepository {
  final AppApi _api;

  UserPostRepositoryImpl(AppApi api) : _api = api;

  @override
  Future<PostsEntity> getUserPosts(int id, int limit, int last) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getUserPosts(id, limit, last);

      final data = response.data['data'];

      return PostsDto.fromJson(data).toEntity();
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

  @override
  Future<PostCommentEntity> createPostComment(
    int postId,
    String text, {
    int? toCommentId,
  }) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.createPostComment(
        {
          'text': text,
          'postId': postId,
          'toCommentId': toCommentId,
        },
      );

      final data = response.data['data'];

      return PostCommentDto.fromJson(data).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PostEntity> getUserPost(int id) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getUserPost(id);

      final data = response.data['data'];

      return PostDto.fromJson(data).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PostCommentsEntity> getPostComments(
    int postId,
    int limit,
    int last,
  ) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getPostComments(postId, limit, last);

      final data = response.data['data'];

      return PostCommentsDto.fromJson(data).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ReactionType> updateCommentReaction(int id, ReactionType type) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.updateCommentReaction(id, type.name);

      final data = response.data['data'];

      return mapToReactionType(data['type']);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteComment(int id) async {
    await _api.setHeaderLocale();
    try {
      await _api.deleteComment(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PostCommentEntity> updateComment(
    int commentId,
    String text,
    int postId, {
    int? toCommentId,
  }) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.updateComment(
        commentId,
        {
          'text': text,
          'postId': postId,
          'toCommentId': toCommentId,
        },
      );

      final data = response.data['data'];

      return PostCommentDto.fromJson(data).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
