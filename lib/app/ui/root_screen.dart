import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../feature/auth/ui/login_screen.dart';
import '../../feature/auth/ui/components/auth_builder.dart';
import '../../feature/main/ui/main_screen.dart';
import '../../l10n/l10n.dart';
import '../data/setting_provider/locale_provider.dart';
import '../data/setting_provider/theme_provider.dart';
import '../domain/entities/device_entity/device_entity.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({
    Key? key,
    required this.device,
    required this.firstStart,
  }) : super(key: key);
  final DeviceEntity device;
  final bool firstStart;

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleProvider>(context).locale;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: theme.brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: MaterialApp(
        title: 'OvesDu Application',
        theme: theme,
        locale: locale,
        supportedLocales: L10n.supportedLocales,
        localizationsDelegates: L10n.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        home: AuthBuilder(
          isNotAuthorized: (context) => LoginScreen(
            device: device,
            firstStart: firstStart,
          ),
          isAuthorized: (context, value, child) => const MainScreen(),
        ),
      ),
    );
  }
}
