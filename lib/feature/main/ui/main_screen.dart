import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/ui/components/app_scaffold.dart';
import '../../../app/ui/components/buttons/language_button/language_button.dart';
import '../../../app/ui/components/buttons/theme_button/theme_button.dart';
import '../../profile/domain/state/profile_cubit.dart';
import '../../profile/ui/profile_screen.dart';
import '../../profile/ui/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String _name = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
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
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        ),
                        child: Icon(
                          CupertinoIcons.profile_circled,
                          size: buttonHeight,
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .hintColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const UserScreen(),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
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
            BlocListener<ProfileCubit, ProfileState>(
              listener: (context, state) {
                state.whenOrNull(
                  received: (userEntity) {
                    setState(() {
                      _name = ' ${userEntity.firstName}';
                    });
                  },
                );
              },
              child: SizedBox(
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
