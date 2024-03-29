import 'dart:io';

import 'package:domain/entity/device_entity/device_entity.dart';
import 'package:domain/state/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/ui/components/app_scaffold.dart';
import '../../../app/ui/components/created_by_widget.dart';
import '../../../app/ui/components/logo/logo_sliver_delegate.dart';
import 'register_screen.dart';
import 'widgets/contact_widget.dart';
import 'widgets/first_settings_widget.dart';
import 'widgets/username_widget.dart';
import 'widgets/password_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    required this.device,
    required this.firstStart,
  }) : super(key: key);
  final DeviceEntity device;
  final bool firstStart;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;
  late TextEditingController _countryCodeController;
  late AuthCubit cubit;

  late final PageController _pageController;

  late String username = '';
  late DeviceEntity device = widget.device;

  late ValueNotifier<bool> _isAuth;
  late ValueNotifier<String> _phoneNotifier;

  late final ValueNotifier<List<String>> _notifications = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _countryCodeController = TextEditingController();
    cubit = context.read<AuthCubit>();
    _pageController = PageController(
      initialPage: widget.firstStart ? 0 : 1,
      keepPage: true,
    );

    _isAuth = ValueNotifier(true);
    _phoneNotifier = ValueNotifier('');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _countryCodeController.dispose();

    _isAuth.dispose();
    _phoneNotifier.dispose();

    _notifications.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      notifications: _notifications,
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
                      _isAuth,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2.6,
                            child: PageView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _pageController,
                              children: [
                                FirstSettingsWidget(
                                  onConfirm: () => changePage(1),
                                ),
                                BlocConsumer<AuthCubit, AuthState>(
                                  builder: (context, state) {
                                    return UsernameWidget(
                                      notifications: _notifications,
                                      controller: _usernameController,
                                      onTap: () {
                                        _isAuth.value
                                            ? onTapToCheckUsernameSignIn(cubit)
                                            : onTapToCheckUsernameSignUp(cubit);
                                        _unfocused();
                                      },
                                      isAuth: _isAuth,
                                    );
                                  },
                                  listener: (context, state) {
                                    state.whenOrNull(
                                      checked: (value) {
                                        username = value;
                                        changePage(2);
                                      },
                                      usernameChecked: () {
                                        username = _usernameController.text;
                                        changePage(2);
                                      },
                                    );
                                  },
                                ),
                                _isAuth.value
                                    ? PasswordWidget(
                                        notifications: _notifications,
                                        username: username,
                                        controller: _passwordController,
                                        onTapBack: () {
                                          changePage(1);
                                          _passwordController.text = '';
                                          _unfocused();
                                          _notifications.value = [];
                                        },
                                        onTapAuthorize: () {
                                          onTapToAuthorize(cubit);
                                          _unfocused();
                                        },
                                      )
                                    : ContactWidget(
                                        notifications: _notifications,
                                        username: username,
                                        emailController: _emailController,
                                        phoneNumberNotifier: _phoneNotifier,
                                        countryCodeController:
                                            _countryCodeController,
                                        onTapBack: () {
                                          changePage(1);
                                          _emailController.text = '';
                                          _phoneNotifier.value = '';
                                          _unfocused();
                                          _notifications.value = [];
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
                            top: 12.0,
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
      phoneNumber: _phoneNotifier.value,
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
          phoneNumber: _phoneNotifier.value,
          device: device,
          phoneCountryCode: _countryCodeController.text,
        ),
      ),
    )
        .then((value) {
      if (value != null) {
        _notifications.value.clear();
        _isAuth.value = true;
        _usernameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _usernameController.clear();
        _countryCodeController.clear();
        _pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 1),
          curve: Curves.ease,
        );
      }
    });
  }

  void _unfocused() => FocusManager.instance.primaryFocus?.unfocus();
}
