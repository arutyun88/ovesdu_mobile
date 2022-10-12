import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/setting_provider/locale_provider.dart';
import '../../common/setting_provider/theme_provider.dart';
import '../../l10n/l10n.dart';
import '../../ui/pages/auth_page.dart';
import '../domain/app_builder.dart';

class MainAppBuilder implements AppBuilder {
  @override
  Widget buildApp(String locale, bool isLightTheme) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider(locale)),
        ChangeNotifierProvider(create: (_) => ThemeProvider(isLightTheme)),
      ],
      child: const OvesDuApp(),
    );
  }
}

class OvesDuApp extends StatelessWidget {
  const OvesDuApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleProvider>(context).locale;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return MaterialApp(
      title: 'OvesDu Application',
      theme: theme,
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
            value: locale,
            onTap: () {
              final provider = Provider.of<LocaleProvider>(
                context,
                listen: false,
              );
              provider.setLocale(locale.languageCode);
            },
            child: Center(
              child: Text(
                flag,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
