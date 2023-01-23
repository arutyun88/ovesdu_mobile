abstract class UserPostHelper {
  const UserPostHelper._();

  static String likeCount(int like, int dislike) {
    final dif = like - dislike;
    if (dif == 0) {
      return '$dif';
    }

    final String sign;
    if (dif < 0) {
      sign = '-';
    } else {
      sign = '+';
    }

    final String value;
    if (dif.abs() >= 1000) {
      value = '$sign ${dif.abs() / 1000} K';
    } else {
      value = '$sign ${dif.abs()}';
    }
    return value;
  }
}
