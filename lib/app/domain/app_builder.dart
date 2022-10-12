import 'package:flutter/material.dart';

abstract class AppBuilder {
  Widget buildApp(String locale, bool isLightTheme);
}
