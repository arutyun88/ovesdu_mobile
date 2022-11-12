import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../const/const.dart';
import '../../../../data/setting_provider/locale_provider.dart';
import '../../../../data/setting_provider/theme_provider.dart';
import 'language_dialog.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  final _key = GlobalKey();

  late ThemeProvider _themeProvider;
  late LocaleProvider _localeProvider;

  late List<Locale> _supportedLocales;
  late Locale _currentLocale;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localeProvider = Provider.of<LocaleProvider>(context);
    _themeProvider = Provider.of<ThemeProvider>(context);

    _supportedLocales = L10n.supportedLocales;
    _currentLocale = _supportedLocales.firstWhere(
      (locale) => locale == _localeProvider.locale,
    );
  }

  void _changeLanguage(Locale locale) =>
      _localeProvider.setLocale(locale.languageCode);

  void _open() {
    LanguageDialog.show(context, _key, _supportedLocales, _currentLocale).then(
      (locale) {
        if (locale != null &&
            locale.languageCode != _currentLocale.languageCode) {
          _changeLanguage(locale);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTap: _open,
      child: Container(
        height: languageButtonSize,
        width: languageButtonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.0,
            color: _themeProvider.themeData.hintColor.withOpacity(.3),
          ),
        ),
        child: Center(
          child: Text(
            _currentLocale.languageCode.toUpperCase(),
            maxLines: 1,
            style: _themeProvider.themeData.textTheme.bodyText2?.apply(
              color: _themeProvider.themeData.hintColor.withOpacity(.7),
            ),
          ),
        ),
      ),
    );
  }
}
