import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ovesdu_mobile/config/app_theme.dart';
import 'package:ovesdu_mobile/config/locale_provider.dart';
import 'package:ovesdu_mobile/l10n/l10n.dart';
import 'package:ovesdu_mobile/ui/pages/auth_page.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final settings = await Hive.openBox('settings');
  String locale =
      settings.get('locale') ?? Platform.localeName.split('_').first;

  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(locale),
      child: const OvesDuApp(),
    ),
  );
}

class OvesDuApp extends StatelessWidget {
  const OvesDuApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleProvider>(context).locale;
    return MaterialApp(
      title: 'OvesDu Application',
      theme: AppTheme.light,
      locale: locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,
      home: const AuthPage(),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: provider.locale,
        icon: Container(width: 12.0),
        items: L10n.supportedLocales.map((locale) {
          final flag = L10n.getFlag(locale.languageCode);
          return DropdownMenuItem(
            child: Center(
              child: Text(
                flag,
                style: const TextStyle(fontSize: 32),
              ),
            ),
            value: locale,
            onTap: () {
              final provider = Provider.of<LocaleProvider>(
                context,
                listen: false,
              );
              provider.setLocale(locale.languageCode);
            },
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
