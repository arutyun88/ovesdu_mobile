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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Column(
                        children: [
                          _selectedIndex == 0
                              ? UsernameWidget(
                                  controller: _usernameController,
                                  onPressedNext: () {
                                    setState(() => _selectedIndex = 1);
                                  },
                                )
                              : RegisterInfoWidget(
                                  emailController: _emailController,
                                  phoneController: _phoneController,
                                  onPressedBack: () {
                                    setState(() => _selectedIndex = 0);
                                  },
                                  onPressedNext: () => setState(() {}),
                                ),
                          const CreatedByWidget(),
                        ],
                      ),
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
}
