import 'package:flutter/widgets.dart';

abstract class Helpers {
  const Helpers._();

  static bool isNumeric(String value) =>
      value.isNotEmpty && double.tryParse(value) != null;

  static void unfocused() => FocusManager.instance.primaryFocus?.unfocus();
}
