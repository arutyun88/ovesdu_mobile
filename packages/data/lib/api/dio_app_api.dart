import 'package:data/api/query_key.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class DioAppApi implements AppApi {
  final ApiDio _api;

  DioAppApi(ApiDio api) : _api = api;

  @override
  Future<Response> getLocations(String query) {
    try {
      return _api.dio.get('/library/location/$query');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> saveLocation(Map<String, dynamic> data) {
    try {
      return _api.dio.put('/library/location', queryParameters: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> searchLocations(String query) {
    try {
      return _api.dio.post('/library/location/$query');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getProfile() {
    try {
      return _api.dio.get('/auth/user');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserProfile(String userId) {
    try {
      return _api.dio.get(
        '/auth/profile',
        queryParameters: {QueryKey.userId: userId},
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserProfileStatistic(String userId) {
    try {
      return _api.dio.get(
        '/data/statistic',
        queryParameters: {QueryKey.userId: userId},
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserProfileFollowers(Map<String, dynamic> data) {
    try {
      return _api.dio.post('/auth/profile/simple', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getMyFollowersIds() {
    try {
      return _api.dio.get('/data/followers');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getBlockedIds() {
    try {
      return _api.dio.get('/auth/profile/block');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> createFollowing(String id) {
    try {
      return _api.dio.put('/data/followers/$id');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> deleteFollowing(String id) {
    try {
      return _api.dio.delete('/data/followers/$id');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> addBlocked(String id) {
    try {
      return _api.dio.put('/auth/profile/block/$id');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> removeBlocked(String id) {
    try {
      return _api.dio.delete('/auth/profile/block/$id');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserPosts(int id, int limit, int last) {
    try {
      return _api.dio.get(
        '/data/post/$id',
        queryParameters: {
          QueryKey.limit: limit,
          QueryKey.last: last,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> updatePostReaction(int id, String type) {
    try {
      return _api.dio.put(
        '/data/like/$id',
        queryParameters: {
          QueryKey.type: type,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> createPostComment(Map<String, dynamic> body) {
    try {
      return _api.dio.post(
        '/data/comment',
        data: body,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserPost(int id) {
    try {
      return _api.dio.get(
        '/data/post/$id/check',
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getPostComments(int id, int limit, int last) {
    try {
      return _api.dio.get(
        '/data/comment',
        queryParameters: {
          QueryKey.postId: id,
          QueryKey.limit: limit,
          QueryKey.last: last,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> updateCommentReaction(int id, String type) {
    try {
      return _api.dio.put(
        '/data/comment/$id/reaction',
        queryParameters: {
          QueryKey.type: type,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> deleteComment(int id) {
    try {
      return _api.dio.delete(
        '/data/comment/$id',
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> updateComment(int id, Map<String, dynamic> body) {
    try {
      return _api.dio.put(
        '/data/comment/$id',
        data: body,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getPosts(String type, int limit, int last) {
    try {
      return _api.dio.get(
        '/data/post',
        queryParameters: {
          QueryKey.type: type,
          QueryKey.limit: limit,
          QueryKey.last: last,
        },
      );
    } catch (_) {
      rethrow;
    }
  }
}
