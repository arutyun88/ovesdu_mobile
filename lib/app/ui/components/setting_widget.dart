import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ovesdu_mobile/app/helpers/app_icons.dart';
import 'package:ovesdu_mobile/app/ui/config/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../l10n/l10n.dart';
import '../../data/setting_provider/locale_provider.dart';
import '../../data/setting_provider/theme_provider.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({Key? key}) : super(key: key);

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  late double height = 0;

  late List<Locale> _supportedLocales;
  late ThemeProvider _theme;
  late LocaleProvider _locale;
  late Locale _currentLocale;

  final double langItemHeight = 40;
  final double themeHeight = 50;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _supportedLocales = L10n.supportedLocales;
    _locale = Provider.of<LocaleProvider>(context);
    _theme = Provider.of<ThemeProvider>(context);
    _currentLocale =
        _supportedLocales.firstWhere((locale) => locale == _locale.locale);
  }

  @override
  Widget build(BuildContext context) {
    var heightContainer = (_supportedLocales.length * langItemHeight) +
        (_supportedLocales.length * 4) +
        themeHeight;
    return SizedBox(
      height: heightContainer,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(
                  () => height == 0 ? height = heightContainer : height = 0,
                );
              },
              child: Icon(
                CupertinoIcons.settings,
                size: 36,
                color: _theme.themeData.textTheme.headline5?.color
                    ?.withOpacity(.3),
              ),
            ),
          ),
          Positioned(
            right: 50,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: _theme.themeData.backgroundColor,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.hintTextColor,
                    blurRadius: 10.0,
                  )
                ],
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              height: height,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ..._supportedLocales
                        .map(
                          (locale) => _LanguageWidget(
                            onTap: () => _changeLanguage(locale),
                            text: L10n.getLanguage(locale.languageCode),
                            itemHeight: langItemHeight,
                            color: _currentLocale == locale
                                ? _theme.themeData.textTheme.headline6?.color
                                : _theme.themeData.textTheme.headline6?.color
                                    ?.withOpacity(.6),
                          ),
                        )
                        .toList(),
                    SizedBox(
                      width: 90,
                      height: themeHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ThemeItemWidget(
                            iconAsset: AppIcons.moonIcon,
                            size: 28,
                            color: _theme.isLightTheme
                                ? _theme.themeData.textTheme.headline6?.color
                                : _theme.themeData.textTheme.headline6?.color
                                    ?.withOpacity(.3),
                            onTap: _theme.isLightTheme ? null : _changeTheme,
                          ),
                          _ThemeItemWidget(
                            iconAsset: AppIcons.sunIcon,
                            size: 36,
                            color: _theme.isLightTheme
                                ? _theme.themeData.textTheme.headline6?.color
                                    ?.withOpacity(.3)
                                : _theme.themeData.textTheme.headline6?.color,
                            onTap: _theme.isLightTheme ? _changeTheme : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeTheme() {
    _theme.setTheme();
  }

  void _changeLanguage(Locale locale) {
    _locale.setLocale(locale.languageCode);
  }
}

class _LanguageWidget extends StatelessWidget {
  const _LanguageWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.itemHeight,
    required this.color,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final double itemHeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: itemHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Center(
                child: Text(
                  text,
                  style: Provider.of<ThemeProvider>(context)
                      .themeData
                      .textTheme
                      .headline6
                      ?.apply(color: color),
                ),
              ),
            ),
          ),
        ),
        Container(width: 100, height: 1, color: AppColors.hintTextColor),
      ],
    );
  }
}

class _ThemeItemWidget extends StatelessWidget {
  const _ThemeItemWidget({
    Key? key,
    required this.iconAsset,
    required this.size,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final String iconAsset;
  final double size;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconAsset,
        height: size,
        color: color,
      ),
    );
  }
}
