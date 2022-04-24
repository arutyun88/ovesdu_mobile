import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/config/app_theme.dart';
import 'package:ovesdu_mobile/ui/pages/auth_page.dart';

void main() => runApp(const OvesDuApp());

class OvesDuApp extends StatelessWidget {
  const OvesDuApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OvesDu Application',
      theme: AppTheme.light,
      home: const AuthPage(),
    );
  }
}
