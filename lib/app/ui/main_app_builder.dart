import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../common/setting_provider/locale_provider.dart';
import '../../common/setting_provider/theme_provider.dart';
import '../../feature/auth/domain/auth_repository.dart';
import '../../feature/auth/domain/state/auth_cubit.dart';
import '../../l10n/l10n.dart';
import '../di/init_di.dart';
import '../domain/app_builder.dart';
import 'root_screen.dart';

class MainAppBuilder implements AppBuilder {
  @override
  Widget buildApp(String locale, bool isLightTheme) {
    return _GlobalProviders(
      locale: locale,
      isLightTheme: isLightTheme,
      child: const OvesDuApp(),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({
    Key? key,
    required this.child,
    required this.locale,
    required this.isLightTheme,
  }) : super(key: key);

  final Widget child;
  final String locale;
  final bool isLightTheme;

  @override
  Widget build(BuildContext context) {
    // TODO MultiBlocProvider and locale and isLightTheme with locator
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(locator<AuthRepository>())),
        ChangeNotifierProvider(create: (_) => LocaleProvider(locale)),
        ChangeNotifierProvider(create: (_) => ThemeProvider(isLightTheme)),
      ],
      child: child,
    );
  }
}

class OvesDuApp extends StatelessWidget {
  const OvesDuApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleProvider>(context).locale;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return MaterialApp(
      title: 'OvesDu Application',
      theme: theme,
      locale: locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: theme.brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: const RootScreen(),
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: provider.locale,
        icon: Container(width: 12.0),
        items: L10n.supportedLocales.map((locale) {
          final flag = L10n.getFlag(locale.languageCode);
          return DropdownMenuItem(
            value: locale,
            onTap: () {
              final provider = Provider.of<LocaleProvider>(
                context,
                listen: false,
              );
              provider.setLocale(locale.languageCode);
            },
            child: Center(
              child: Text(
                flag,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
