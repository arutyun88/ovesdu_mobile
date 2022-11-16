import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../data/setting_provider/locale_provider.dart';

String ageCalculatedTitle(BuildContext context, DateTime birthday) {
  final locale = Provider.of<LocaleProvider>(context).locale.languageCode;
  final age = ageCalculate(birthday);

  if (locale == 'ru') {
    if (age == 2 ||
        age == 3 ||
        age == 4 ||
        (age > 20 && age % 10 > 1 && age % 10 <= 4)) {
      return '$age года';
    } else if (age == 1 || (age > 20 && age % 10 == 1)) {
      return '$age год';
    } else {
      return '$age лет';
    }
  } else {
    final dictionary = AppLocalizations.of(context)!;
    return dictionary.year(age.toString());
  }
}

int ageCalculate(DateTime birthday) {
  final currentDate = DateTime.now();
  if (birthday.isAfter(currentDate)) {
    return 0;
  }
  return currentDate.year -
      birthday.year -
      1 +
      ((currentDate.month >= birthday.month && currentDate.day > birthday.day)
          ? 0
          : 1);
}
