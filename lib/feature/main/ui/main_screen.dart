import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/ui/components/app_scaffold.dart';
import '../../../app/ui/components/buttons/language_button/language_button.dart';
import '../../../app/ui/components/buttons/theme_button/theme_button.dart';
import '../../auth/domain/state/auth_cubit.dart';
import '../../profile/domain/profile_repository.dart';
import '../../profile/domain/state/profile_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(locator<ProfileRepository>()),
      child: const _MainScreen(),
    );
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  late String _name = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().state.whenOrNull(received: (userEntity) {
      _name = ' ${userEntity.name}';
    });
    return AppScaffold(
      notifications: ValueNotifier([]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: mainPadding),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: verticalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: verticalPadding),
                            child: ThemeButton(),
                          ),
                          LanguageButton(),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => context.read<AuthCubit>().logOut(),
                        child: Icon(
                          Icons.exit_to_app,
                          size: buttonHeight,
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: SizedBox.shrink(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                child: Text(
                  AppLocalizations.of(context)!.soonWillBeInteresting(_name),
                  style: Provider.of<ThemeProvider>(context)
                      .themeData
                      .textTheme
                      .headline5,
                ),
              ),
            ),
            const Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: SizedBox.shrink(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                child: Text(
                  AppLocalizations.of(context)!.comeAgain,
                  textAlign: TextAlign.end,
                  style: Provider.of<ThemeProvider>(context)
                      .themeData
                      .textTheme
                      .headline5,
                ),
              ),
            ),
            const Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: SizedBox.shrink(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                child: Text(
                  AppLocalizations.of(context)!.necessarily,
                  textAlign: TextAlign.end,
                  style: Provider.of<ThemeProvider>(context)
                      .themeData
                      .textTheme
                      .headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
