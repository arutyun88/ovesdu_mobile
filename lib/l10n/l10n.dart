import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  static String getFlag(String code) {
    return _Language.languages
        .firstWhere((element) => element.language == code)
        .flag;
  }

  static final supportedLocales = _Language.languages
      .map((locale) => Locale(
            locale.language,
            locale.country,
          ))
      .toList();

  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}

class _Language {
  final String name;
  final String flag;
  final String language;
  final String country;

  const _Language({
    required this.name,
    required this.flag,
    required this.language,
    required this.country,
  });

  static const List<_Language> languages = [
    _Language(name: 'Հայերեն', flag: '🇦🇲', language: 'hy', country: 'AM'),
    _Language(name: 'English', flag: '🇺🇸', language: 'en', country: 'US'),
    _Language(name: 'Русский', flag: '🇷🇺', language: 'ru', country: 'RU'),
    _Language(name: 'Français', flag: '🇫🇷', language: 'fr', country: 'FR'),
  ];
}
