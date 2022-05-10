import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


// Language code
const String english = 'en';
const String russian = 'ru';
// const String armenian = 'hy';
// const String france = 'fr';

const String languageCode = 'language_code';

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, 'US');
    case russian:
      return const Locale(russian, 'RU');
  // case armenian:
  //   return const Locale(armenian, 'AM');
  // case france:
  //   return const Locale(france, 'FR');
    default:
      return const Locale(english, 'US');
  }
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String locale = _prefs.getString(languageCode) ?? english;
  return _locale(locale);
}

class L10n {
  static final supportedLocales = [
    const Locale(english, 'US'),
    const Locale(russian, 'RU'),
  ];

  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static String getFlag(String code) {
    switch (code) {
      case russian:
        return '🇷🇺';
      default:
        return '🇺🇸';
    }
  }
}
