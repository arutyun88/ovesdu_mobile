import 'dart:io';

abstract class DeviceHelper {
  const DeviceHelper._();

  static String deviceId() => Platform.isAndroid
      ? 'android device id'
      : Platform.isIOS
          ? 'ios device id'
          : 'unknown';

  static String deviceType() => Platform.isIOS
      ? 'ios'
      : Platform.isAndroid
          ? 'android'
          : 'desktop';

  static String locale() {
    final locale = Platform.localeName;
    final spliterator = locale.contains('_') ? '_' : '-';
    return locale.split(spliterator).first;
  }
}
