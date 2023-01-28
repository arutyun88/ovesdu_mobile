import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/ui/components/app_scaffold.dart';
import '../../../app/ui/components/buttons/empty_button.dart';
import '../../../app/ui/components/buttons/language_button/language_button.dart';
import '../../../app/ui/components/buttons/theme_button/theme_button.dart';
import '../../../app/ui/config/app_colors.dart';
import '../state/profile_cubit.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

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
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.keyboard_arrow_left_sharp,
                          size: buttonHeight,
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .hintColor,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: verticalPadding),
                              child: ThemeButton(),
                            ),
                            LanguageButton(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          context.read<AuthCubit>().logOut();
                        },
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
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: mainPadding,
                vertical: verticalPadding,
              ),
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  final profile = state.whenOrNull(
                    received: (userEntity) => userEntity,
                  );
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.orange,
                        radius: mainPadding,
                        child: Text(
                          profile?.firstName.split('').first.toUpperCase() ??
                              '',
                          style: Provider.of<ThemeProvider>(context)
                              .themeData
                              .textTheme
                              .headline4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: mainPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: verticalPadding / 2,
                              ),
                              child: Text(
                                '${profile?.firstName ?? ''} ${profile?.lastName ?? ''}',
                                style: Provider.of<ThemeProvider>(context)
                                    .themeData
                                    .textTheme
                                    .headline5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: verticalPadding / 2,
                              ),
                              child: Text(
                                profile?.username ?? '',
                                style: Provider.of<ThemeProvider>(context)
                                    .themeData
                                    .textTheme
                                    .headline6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: verticalPadding / 2,
                              ),
                              child: Text(
                                profile?.email ?? '',
                                style: Provider.of<ThemeProvider>(context)
                                    .themeData
                                    .textTheme
                                    .headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: mainPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: mainPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: EmptyButton(
                      child: Text(
                        'change password',
                        textAlign: TextAlign.center,
                        style: Provider.of<ThemeProvider>(context)
                            .themeData
                            .textTheme
                            .headline6
                            ?.copyWith(
                              color: AppColors.orange,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const Flexible(child: SizedBox(width: mainPadding)),
                  Flexible(
                    child: EmptyButton(
                      child: Text(
                        'change profile',
                        textAlign: TextAlign.center,
                        style: Provider.of<ThemeProvider>(context)
                            .themeData
                            .textTheme
                            .headline6
                            ?.copyWith(
                              color: AppColors.orange,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
