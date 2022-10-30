import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/data/setting_provider/locale_provider.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/components/buttons/default_button.dart';
import '../../../../app/ui/components/custom_flex.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../../../l10n/l10n.dart';

class FirstSettingsWidget extends StatefulWidget {
  const FirstSettingsWidget({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  final Function() onConfirm;

  @override
  State<FirstSettingsWidget> createState() => _FirstSettingsWidgetState();
}

class _FirstSettingsWidgetState extends State<FirstSettingsWidget> {
  late List<Locale> _supportedLocales;
  late ThemeProvider _themeProvider;
  late LocaleProvider _localProvider;
  late final PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _supportedLocales = L10n.supportedLocales;
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _localProvider = Provider.of<LocaleProvider>(context, listen: false);

    _currentPage = _supportedLocales.indexOf(_localProvider.locale);

    _pageController = PageController(
      initialPage: _currentPage,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _supportedLocales.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    _localProvider
                        .setLocale(_supportedLocales[index].languageCode);
                    _currentPage = index;
                  },
                  itemBuilder: (context, index) {
                    final local = _supportedLocales[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              L10n.getLanguage(local.languageCode),
                              style:
                                  _themeProvider.themeData.textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CupertinoButton(
                      onPressed: _currentPage != 0 ? _backLanguage : null,
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.chevron_left_outlined,
                        size: 40,
                        color: _currentPage != 0
                            ? AppColors.orange
                            : AppColors.orange.withOpacity(.3),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      onPressed: _currentPage != _supportedLocales.length - 1
                          ? _nextLanguage
                          : null,
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.chevron_right_outlined,
                        size: 40,
                        color: _currentPage != _supportedLocales.length - 1
                            ? AppColors.orange
                            : AppColors.orange.withOpacity(.3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const CustomFlex(flex: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Flexible(
                child: CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: _themeProvider.isLightTheme ? _changeTheme : null,
                  child: Text(
                    _themeProvider.isLightTheme
                        ? AppLocalizations.of(context)!.comeToTheDarkSide
                        : AppLocalizations.of(context)!.stayOnTheDarkSide,
                    textAlign: TextAlign.center,
                    style: _themeProvider.isLightTheme
                        ? _themeProvider.themeData.textTheme.headline4
                        : _themeProvider.themeData.textTheme.headline4?.apply(
                            color: _themeProvider
                                .themeData.textTheme.headline4?.color
                                ?.withOpacity(.5),
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Flexible(
                child: CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: _themeProvider.isLightTheme ? null : _changeTheme,
                  child: Text(
                    _themeProvider.isLightTheme
                        ? AppLocalizations.of(context)!.stayOnTheBrightSide
                        : AppLocalizations.of(context)!.comeToTheBrightSide,
                    textAlign: TextAlign.center,
                    style: _themeProvider.isLightTheme
                        ? _themeProvider.themeData.textTheme.headline4?.apply(
                            color: _themeProvider
                                .themeData.textTheme.headline4?.color
                                ?.withOpacity(.5),
                          )
                        : _themeProvider.themeData.textTheme.headline4,
                  ),
                ),
              ),
            ],
          ),
        ),
        const CustomFlex(flex: 6),
        Align(
          alignment: Alignment.bottomCenter,
          child: DefaultButton(
            title: AppLocalizations.of(context)!.confirm,
            enable: true,
            onPressed: widget.onConfirm,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24),
          child: Text(
            AppLocalizations.of(context)!.themAndLangChangeLater,
            textAlign: TextAlign.center,
            style: _themeProvider.themeData.textTheme.subtitle1?.apply(
              color: _themeProvider.themeData.textTheme.subtitle1?.color
                  ?.withOpacity(.5),
            ),
          ),
        ),
        // const CustomFlex(flex: 2),
      ],
    );
  }

  void _changeTheme() => _themeProvider.setTheme();

  void _backLanguage() {
    _pageController.animateToPage(
      --_currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _nextLanguage() {
    _pageController.animateToPage(
      ++_currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
