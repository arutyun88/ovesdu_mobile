import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_video_entity.freezed.dart';

@freezed
class PostVideoEntity with _$PostVideoEntity {
  const factory PostVideoEntity({
    required int id,
    required DateTime created,
    required String video,
  }) = _PostVideoEntity;
}
