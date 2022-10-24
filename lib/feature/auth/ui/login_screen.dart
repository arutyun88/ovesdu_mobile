import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovesdu_mobile/feature/auth/ui/widgets/password_widget.dart';

import '../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../ui/widgets/created_by_widget.dart';
import '../../../ui/widgets/logo_sliver_delegate.dart';
import '../domain/state/auth_cubit.dart';
import 'widgets/name_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    required this.device,
  }) : super(key: key);
  final DeviceEntity device;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late AuthCubit cubit;

  late final PageController _pageController;

  late String username = '';
  late DeviceEntity device = widget.device;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    cubit = context.read<AuthCubit>();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => setState(() => _unfocused()),
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
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _pageController,
                              children: [
                                BlocConsumer<AuthCubit, AuthState>(
                                  builder: (context, state) {
                                    return NameWidget(
                                      controller: _usernameController,
                                      onTap: () {
                                        onTapToCheckUsername(cubit);
                                        _unfocused();
                                      },
                                    );
                                  },
                                  listener: (context, state) {
                                    state.whenOrNull(
                                      checked: (value) {
                                        username = value;
                                        changePage(1);
                                      },
                                    );
                                  },
                                ),
                                PasswordWidget(
                                  username: username,
                                  controller: _passwordController,
                                  onTapBack: () {
                                    changePage(0);
                                    _passwordController.text = '';
                                    _unfocused();
                                  },
                                  onTapAuthorize: () {
                                    onTapToAuthorize(cubit);
                                    _unfocused();
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
    authCubit.checkUsername(
      username: _usernameController.text,
      device: device,
    );
  }

  void onTapToAuthorize(AuthCubit authCubit) {
    authCubit.signIn(
      username: _usernameController.text,
      password: _passwordController.text,
      device: device,
    );
  }

  void changePage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _unfocused() => FocusManager.instance.primaryFocus?.unfocus();
}
