import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_post_video_entity.freezed.dart';

@freezed
class UserPostVideoEntity with _$UserPostVideoEntity {
  const factory UserPostVideoEntity({
    required int id,
    required DateTime created,
    required String video,
  }) = _UserPostVideoEntity;
}
