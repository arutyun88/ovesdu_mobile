import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovesdu_mobile/app/data/setting_provider/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../feature/auth/domain/state/auth_cubit.dart';
import '../../feature/profile/domain/state/profile_cubit.dart';
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
    bool isCircleAvatar,
  ) {
    return _GlobalProviders(
      locale: locale,
      isLightTheme: isLightTheme,
      isCircleAvatar: isCircleAvatar,
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
    required this.isCircleAvatar,
  }) : super(key: key);

  final Widget child;
  final String locale;
  final bool isLightTheme;
  final bool isCircleAvatar;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => locator.get<AuthCubit>()),
        BlocProvider(create: (context) => locator.get<ProfileCubit>()),
        ChangeNotifierProvider(create: (_) => LocaleProvider(locale)),
        ChangeNotifierProvider(create: (_) => ThemeProvider(isLightTheme)),
        ChangeNotifierProvider(create: (_) => SettingProvider(isCircleAvatar)),
      ],
      child: child,
    );
  }
}
