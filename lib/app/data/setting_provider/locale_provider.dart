import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ovesdu_mobile/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  String _locale;

  LocaleProvider(this._locale);

  Locale get locale {
    return L10n.supportedLocales
        .firstWhere((element) => element.languageCode == _locale);
  }

  void setLocale(String locale) async {
    final settings = await Hive.openBox('settings');
    settings.put('locale', locale);
    _locale = locale;
    notifyListeners();
  }
}
