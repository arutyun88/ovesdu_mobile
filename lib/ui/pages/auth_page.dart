import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/ui/pages/widgets/register_info_widget.dart';
import 'package:ovesdu_mobile/ui/pages/widgets/username_widget.dart';
import 'package:ovesdu_mobile/ui/widgets/created_by_widget.dart';
import 'package:ovesdu_mobile/ui/widgets/logo_sliver_delegate.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  int _selectedIndex = 0;
  final _mainScreenController = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
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
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .55,
                            child: PageView(
                              controller: _mainScreenController,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0),
                                  child: UsernameWidget(
                                    controller: _usernameController,
                                    onPressedNext: _nextOnPressed,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0),
                                  child: RegisterInfoWidget(
                                    emailController: _emailController,
                                    phoneController: _phoneController,
                                    onPressedBack: _backOnPressed,
                                    onPressedNext: () => setState(() {}),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const CreatedByWidget(),
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

  void _nextOnPressed() {
    // setState(() => _selectedIndex = 1);
    _mainScreenController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInCubic,
    );
  }

  void _backOnPressed() {
    // setState(() => _selectedIndex = 0);
    _mainScreenController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInCubic,
    );
  }
}
