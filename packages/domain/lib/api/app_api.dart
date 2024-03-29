import 'package:dio/dio.dart';

abstract class AppApi {

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

  Future<Response> getUserPosts(int id, int limit, int last);

  Future<Response> updatePostReaction(int id, String type);

  Future<Response> createPostComment(Map<String, dynamic> body);

  Future<Response> getUserPost(int id);

  Future<Response> getPostComments(int id, int limit, int last);

  Future<Response> updateCommentReaction(int id, String type);

  Future<Response> deleteComment(int id);

  Future<Response> updateComment(int id, Map<String, dynamic> body);

  Future<Response> getPosts(String type, int limit, int last);
}
