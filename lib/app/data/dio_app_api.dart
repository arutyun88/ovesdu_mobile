import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../domain/app_api.dart';
import 'auth_interceptor.dart';

@Singleton(as: AppApi)
class DioAppApi implements AppApi {
  late final Dio dio;

  DioAppApi(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: 15000,
    );
    dio = Dio(options);
    if (kDebugMode) _addInterceptor(PrettyDioLogger());
    _addInterceptor(AuthInterceptor());
  }

  void _addInterceptor(Interceptor interceptor) {
    if (dio.interceptors.contains(interceptor)) {
      dio.interceptors.remove(interceptor);
    }
    _deleteInterceptor(interceptor.runtimeType);
    dio.interceptors.add(interceptor);
  }

  void _deleteInterceptor(Type type) {
    dio.interceptors.removeWhere((element) => element.runtimeType == type);
  }

  @override
  Future<void> setHeaderLocale() async {
    final settings = await Hive.openBox('settings');
    var locale = settings.get('locale');
    dio.options.headers.addEntries(
      {
        'locale': locale,
      }.entries,
    );
  }

  @override
  Future<Response> request(String path) {
    try {
      return dio.request(path);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> fetch(RequestOptions requestOptions) {
    try {
      return dio.fetch(requestOptions);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> checkContact(Map<String, dynamic> data) {
    try {
      return dio.post('/auth/check', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> checkUsername(String username) {
    try {
      return dio.get('/auth/check/$username');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getName(Map<String, dynamic> data) {
    try {
      return dio.post('/auth/info', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> refreshToken(String? refreshToken) {
    try {
      return dio.post('/auth/token/$refreshToken');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signIn(Map<String, dynamic> data) {
    try {
      return dio.post('/auth/token', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signUp(Map<String, dynamic> data) {
    try {
      return dio.put('/auth/token', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getLocations(String query) {
    try {
      return dio.get('/library/location/$query');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> saveLocation(Map<String, dynamic> data) {
    try {
      return dio.put('/library/location', queryParameters: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> searchLocations(String query) {
    try {
      return dio.post('/library/location/$query');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getProfile() {
    try {
      return dio.get('/auth/user');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserProfile(String userId) {
    try {
      return dio.get(
        '/auth/profile',
        queryParameters: {_QueryKey.userId: userId},
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserProfileStatistic(String userId) {
    try {
      return dio.get(
        '/data/statistic',
        queryParameters: {_QueryKey.userId: userId},
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserProfileFollowers(Map<String, dynamic> data) {
    try {
      return dio.post('/auth/profile/simple', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getMyFollowersIds() {
    try {
      return dio.get('/data/followers');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getBlockedIds() {
    try {
      return dio.get('/auth/profile/block');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> createFollowing(String id) {
    try {
      return dio.put('/data/followers/$id');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> deleteFollowing(String id) {
    try {
      return dio.delete('/data/followers/$id');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> addBlocked(String id) {
    try {
      return dio.put('/auth/profile/block/$id');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> removeBlocked(String id) {
    try {
      return dio.delete('/auth/profile/block/$id');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserPosts(int id, int limit, int last) {
    try {
      return dio.get(
        '/data/post/$id',
        queryParameters: {
          _QueryKey.limit: limit,
          _QueryKey.last: last,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> updatePostReaction(int id, String type) {
    try {
      return dio.put(
        '/data/like/$id',
        queryParameters: {
          _QueryKey.type: type,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> createPostComment(Map<String, dynamic> body) {
    try {
      return dio.post(
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
      return dio.get(
        '/data/post/$id/check',
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getPostComments(int id, int limit, int last) {
    try {
      return dio.get(
        '/data/comment',
        queryParameters: {
          _QueryKey.postId: id,
          _QueryKey.limit: limit,
          _QueryKey.last: last,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> updateCommentReaction(int id, String type) {
    try {
      return dio.put(
        '/data/comment/$id/reaction',
        queryParameters: {
          _QueryKey.type: type,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> deleteComment(int id) {
    try {
      return dio.delete(
        '/data/comment/$id',
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> updateComment(int id, Map<String, dynamic> body) {
    try {
      return dio.put(
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
      return dio.get(
        '/data/post',
        queryParameters: {
          _QueryKey.type: type,
          _QueryKey.limit: limit,
          _QueryKey.last: last,
        },
      );
    } catch (_) {
      rethrow;
    }
  }
}

abstract class _QueryKey {
  const _QueryKey._();

  static const String last = 'last';
  static const String limit = 'limit';
  static const String postId = 'postId';
  static const String type = 'type';
  static const String userId = 'userId';
}
