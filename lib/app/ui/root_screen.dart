import 'package:flutter/material.dart';

import '../../feature/auth/ui/components/auth_builder.dart';
import '../../feature/main/ui/main_screen.dart';
import '../../ui/pages/auth_page.dart';
import 'app_loader.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      // TODO replace AuthPage() to LoginScreen()
      isNotAuthorized: (context) => const AuthPage(),
      isWaiting: (context) => const AppLoader(),
      isAuthorized: (context) => const MainScreen(),
    );
  }
}
