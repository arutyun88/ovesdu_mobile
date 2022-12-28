import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../posts/ui/posts_screen.dart';
import '../../profile/domain/state/profile_cubit.dart';
import '../../profile/ui/user_profile_screen.dart';
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
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: 'person',
            icon: Icon(
              CupertinoIcons.person,
              size: buttonHeight,
              color: Provider.of<ThemeProvider>(context).themeData.hintColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(
              CupertinoIcons.profile_circled,
              size: buttonHeight,
              color: Provider.of<ThemeProvider>(context).themeData.hintColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(
              Icons.person,
              size: buttonHeight,
              color: Provider.of<ThemeProvider>(context).themeData.hintColor,
            ),
          ),
        ],
        onTap: (id) {
          if (id == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UserProfileScreen(
                  userId: '22',
                  firsName: 'Чак',
                  lastName: 'Норрис',
                  image: null,
                ),
              ),
            );
          } else if (id == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PostsScreen(),
              ),
            );
          } else if (id == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UserScreen(),
              ),
            );
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Flexible(
              fit: FlexFit.tight,
              flex: 3,
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
            const Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
