import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../feature/auth/domain/state/auth_cubit.dart';
import '../data/setting_provider/locale_provider.dart';
import '../data/setting_provider/theme_provider.dart';
import '../di/init_di.dart';
import '../domain/app_builder.dart';
import '../domain/entities/device_entity/device_entity.dart';
import 'root_screen.dart';

class MainAppBuilder implements AppBuilder {
  @override
  Widget buildApp(
    String locale,
    bool isLightTheme,
    DeviceEntity device,
    bool firstStart,
  ) {
    return _GlobalProviders(
      locale: locale,
      isLightTheme: isLightTheme,
      child: RootScreen(device: device, firstStart: firstStart),
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
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => locator.get<AuthCubit>()),
        ChangeNotifierProvider(create: (_) => LocaleProvider(locale)),
        ChangeNotifierProvider(create: (_) => ThemeProvider(isLightTheme)),
      ],
      child: child,
    );
  }
}
