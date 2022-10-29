import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../app/ui/components/created_by_widget.dart';
import '../../../app/ui/components/logo_sliver_delegate.dart';
import '../domain/state/auth_cubit.dart';
import 'register_screen.dart';
import 'widgets/contact_widget.dart';
import 'widgets/name_widget.dart';
import 'widgets/password_widget.dart';

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
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late AuthCubit cubit;

  late final PageController _pageController;

  late String username = '';
  late DeviceEntity device = widget.device;

  late ValueNotifier<bool> isAuth;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    cubit = context.read<AuthCubit>();
    _pageController = PageController(initialPage: 0, keepPage: true);
    isAuth = ValueNotifier(true);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
                      isAuth,
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
                                        isAuth.value
                                            ? onTapToCheckUsernameSignIn(cubit)
                                            : onTapToCheckUsernameSignUp(cubit);
                                        _unfocused();
                                      },
                                      isAuth: isAuth,
                                    );
                                  },
                                  listener: (context, state) {
                                    state.whenOrNull(
                                      checked: (value) {
                                        username = value;
                                        changePage(1);
                                      },
                                      usernameChecked: (value) {
                                        username = _usernameController.text;
                                        if (value) changePage(1);
                                      },
                                    );
                                  },
                                ),
                                isAuth.value
                                    ? PasswordWidget(
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
                                      )
                                    : ContactWidget(
                                        username: username,
                                        emailController: _emailController,
                                        phoneController: _phoneController,
                                        onTapBack: () {
                                          changePage(0);
                                          _emailController.text = '';
                                          _phoneController.text = '';
                                          _unfocused();
                                        },
                                        onTapConfirm: () {
                                          onTapToCheckContactSignUp(cubit);
                                          _unfocused();
                                        },
                                        onTapConfirmWhenCorrect: onTapConfirm,
                                      )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 24.0,
                            bottom: Platform.isAndroid ? 12.0 : 0.0,
                          ),
                          child: const CreatedByWidget(),
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

  void onTapToCheckUsernameSignIn(AuthCubit authCubit) {
    authCubit.checkUsernameSignIn(
      username: _usernameController.text,
      device: device,
    );
  }

  void onTapToCheckUsernameSignUp(AuthCubit authCubit) {
    authCubit.checkUsernameSignUp(
      username: _usernameController.text,
    );
  }

  void onTapToCheckContactSignUp(AuthCubit authCubit) {
    authCubit.checkContactSignUp(
      email: _emailController.text,
      phoneNumber: _phoneController.text,
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

  void onTapConfirm() {
    _unfocused();
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => RegisterScreen(
          username: _usernameController.text,
          email: _emailController.text,
          phoneNumber: _phoneController.text,
          device: device,
        ),
      ),
    )
        .then((value) {
      if (value != null) {
        isAuth.value = true;
        _usernameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _passwordController.clear();
        _usernameController.clear();
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 1),
          curve: Curves.ease,
        );
      }
    });
  }

  void _unfocused() => FocusManager.instance.primaryFocus?.unfocus();
}
