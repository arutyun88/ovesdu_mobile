import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/setting_provider/locale_provider.dart';

abstract class Helpers {
  const Helpers._();

  static bool isNumeric(String value) =>
      value.isNotEmpty && double.tryParse(value) != null;

  static void unfocused() => FocusManager.instance.primaryFocus?.unfocus();

  static String answersTitle(BuildContext context, int count) {
    final locale = Provider.of<LocaleProvider>(context).locale.languageCode;

    if (locale == 'ru') {
      if (count == 2 ||
          count == 3 ||
          count == 4 ||
          (count > 20 && count % 10 > 1 && count % 10 <= 4)) {
        return '$count ответа';
      } else if (count == 1 || (count > 20 && count % 10 == 1)) {
        return '$count ответ';
      } else {
        return '$count ответов';
      }
    } else {
      return AppLocalizations.of(context)!.answers('$count');
    }
  }
}
