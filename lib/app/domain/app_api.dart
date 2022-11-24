import 'package:dio/dio.dart';

abstract class AppApi {
  Future<void> setHeaderLocale();

  Future<Response> request(String path);

  Future<Response> fetch(RequestOptions requestOptions);

  Future<Response> getName(Map<String, dynamic> data);

  Future<Response> checkUsername(String username);

  Future<Response> checkContact(Map<String, dynamic> data);

  Future<Response> signIn(Map<String, dynamic> data);

  Future<Response> signUp(Map<String, dynamic> data);

  Future<Response> refreshToken(String? refreshToken);

  Future<Response> getLocations(String query);

  Future<Response> searchLocations(String query);

  Future<Response> saveLocation(Map<String, dynamic> data);

  Future<Response> getProfile();

  Future<Response> getUserProfile(String userId);

  Future<Response> getUserProfileStatistic(String userId);

  Future<Response> getUserProfileFollowers(Map<String, dynamic> data);

  Future<Response> getMyFollowersIds();

  Future<Response> getBlockedIds();

  Future<Response> createFollowing(String id);

  Future<Response> deleteFollowing(String id);

  Future<Response> addBlocked(String id);

  Future<Response> removeBlocked(String id);
}
