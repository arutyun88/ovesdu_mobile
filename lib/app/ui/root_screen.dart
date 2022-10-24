import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../common/setting_provider/locale_provider.dart';
import '../../common/setting_provider/theme_provider.dart';
import '../../feature/auth/ui/login_screen.dart';
import '../../feature/auth/ui/components/auth_builder.dart';
import '../../feature/main/ui/main_screen.dart';
import '../../l10n/l10n.dart';
import '../domain/entities/device_entity/device_entity.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({
    Key? key,
    required this.device,
  }) : super(key: key);
  final DeviceEntity device;

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
        home: AuthBuilder(
          // TODO replace AuthPage() to LoginScreen()
          // isNotAuthorized: (context) => const AuthPage(),
          isNotAuthorized: (context) => LoginScreen(device: device),
          isAuthorized: (context, value, child) => const MainScreen(),
        ),
      ),
    );
  }
}
