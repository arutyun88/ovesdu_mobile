import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/setting_provider/locale_provider.dart';

abstract class DateHelper {
  const DateHelper._();

  static String wasOnline(BuildContext context, DateTime date) {
    final dictionary = AppLocalizations.of(context)!;
    final currentDate = DateTime.now();
    final difference = currentDate.difference(date);
    final currentHours = currentDate.hour + (currentDate.minute / 60);

    final isToday = currentHours - difference.inHours > 0.0;
    if (isToday) {
      if (difference.inSeconds <= 60 * 14) {
        return dictionary.online;
      }
      if (difference.inSeconds < 60 * 16) {
        return dictionary.was(dictionary.fifteenMinutesAgo);
      }
      if (difference.inSeconds <= 60 * 60) {
        return dictionary.was(dictionary.lessThanHour);
      } else {
        return dictionary.was(dictionary.fewHours);
      }
    } else {
      final isYesterday = (currentHours + 24) - difference.inHours > 0;
      if (isYesterday) {
        return dictionary.was(dictionary.yesterday);
      } else {
        var days = ((difference.inHours - currentHours) / 24).truncate() + 1;
        if (days <= 3) {
          return dictionary.was(dictionary.fewDays);
        }
        if (days <= 30) {
          return dictionary.was(dictionary.severalWeeksAgo);
        }
        if (days <= 60) {
          return dictionary.was(dictionary.overAMonth);
        } else {
          return dictionary.was(dictionary.fewMonths);
        }
      }
    }
  }

  static bool isOnline(DateTime date) =>
      DateTime.now().difference(date).inSeconds <= 60 * 14;

  static String wasPublished(BuildContext context, DateTime date) {
    final dictionary = AppLocalizations.of(context)!;
    final locale = Provider.of<LocaleProvider>(context).locale.languageCode;

    final currentDate = DateTime.now();
    final today =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    final todayStartInMillisecondsAgo =
        currentDate.millisecondsSinceEpoch - today.millisecondsSinceEpoch;
    final yesterdayStartInMillisecondsAgo = currentDate.millisecondsSinceEpoch -
        today.subtract(const Duration(days: 1)).millisecondsSinceEpoch;

    final difInMilliseconds =
        currentDate.millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    String time = '';
    if (locale == 'en') {
      time = DateFormat.jm().format(date);
    } else {
      time = DateFormat.Hm().format(date);
    }

    if (difInMilliseconds < todayStartInMillisecondsAgo) {
      return dictionary.todayAtTime(time);
    } else if (difInMilliseconds < yesterdayStartInMillisecondsAgo) {
      return dictionary.yesterdayAtTime(time);
    } else {
      return '${DateFormat('dd.MM.yyyy').format(date)} $time';
    }
  }
}

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
