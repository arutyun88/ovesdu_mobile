import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  static String getFlag(String code) {
    return _Language.languages
        .firstWhere((element) => element.language == code)
        .flag;
  }

  static String getLanguage(String code) {
    return _Language.languages
        .firstWhere((element) => element.language == code)
        .name;
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
    _Language(name: 'հայերեն', flag: '🇦🇲', language: 'hy', country: 'AM'),
    _Language(name: 'english', flag: '🇺🇸', language: 'en', country: 'US'),
    _Language(name: 'русский', flag: '🇷🇺', language: 'ru', country: 'RU'),
    _Language(name: 'français', flag: '🇫🇷', language: 'fr', country: 'FR'),
  ];
}
