import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/widgets/created_by_widget.dart';
import '../../ui/widgets/logo_sliver_delegate.dart';
import 'domain/state/auth_cubit.dart';
import 'ui/widgets/name_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late AuthCubit cubit;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    cubit = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              FocusManager.instance.primaryFocus?.unfocus();
            });
          },
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              width: MediaQuery.of(context).size.width,
              child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                    delegate: LogoDelegate(
                      MediaQuery.of(context).size.height / 3,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2.7,
                            child: PageView(
                              children: [
                                BlocBuilder<AuthCubit, AuthState>(
                                  builder: (context, state) {
                                    return NameWidget(
                                      controller: _usernameController,
                                      onTap: () {
                                        onTapToCheckUsername(cubit);
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      buttonEnabled:
                                          state != AuthState.waiting(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 24.0),
                          child: CreatedByWidget(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapToCheckUsername(AuthCubit authCubit) {
    authCubit.checkUsername(username: _usernameController.text);
  }
}
