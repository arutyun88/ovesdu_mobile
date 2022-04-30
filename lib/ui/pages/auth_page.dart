import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';
import 'package:ovesdu_mobile/ui/widgets/created_by_widget.dart';
import 'package:ovesdu_mobile/ui/widgets/fields/custom_text_field.dart';
import 'package:ovesdu_mobile/ui/widgets/logo_sliver_delegate.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late FocusNode _loginFocus;
  late TextEditingController _controller;
  late bool isComplete;
  late bool enabled;
  late String errorText;

  @override
  void initState() {
    super.initState();
    _loginFocus = FocusNode();
    _controller = TextEditingController();
    _validate();
  }

  @override
  void dispose() {
    _loginFocus.dispose();
    _controller.dispose();
    super.dispose();
  }

  _validate() {
    var value = _controller.text.trim();
    errorText = '';
    if (value.isEmpty) {
      errorText = '';
      isComplete = true;
      enabled = false;
    } else {
      if (value.length < 4) {
        errorText = 'username не может быть менее 4 знаков';
        isComplete = false;
        enabled = false;
      } else {
        errorText = '';
        isComplete = true;
        enabled = true;
      }
    }
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
                          CustomTextField(
                            hintText: 'enter your username',
                            labelText: 'username',
                            controller: _controller,
                            loginFocus: _loginFocus,
                            onTap: () {
                              setState(() {
                                _loginFocus.hasFocus;
                              });
                            },
                            borderColor:
                                isComplete ? AppColors.orange : AppColors.red,
                            onChanged: (value) {
                              setState(() {
                                _validate();
                              });
                            },
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 40.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    errorText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .apply(color: AppColors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                minSize: 0,
                                padding: EdgeInsets.zero,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: enabled
                                        ? AppColors.orange
                                        : AppColors.orange.withOpacity(.5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                    vertical: 10.0,
                                  ),
                                  child: const Text(
                                    'next',
                                    style: TextStyle(
                                      color: AppColors.buttonTextColor,
                                    ),
                                  ),
                                ),
                                onPressed: enabled ? () {} : null,
                              ),
                            ],
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 60.0,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Flexible(
                                child: Text(
                                  'If you already have an account, please',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                minSize: 0,
                                padding: EdgeInsets.zero,
                                child: const Text(
                                  'login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.orange,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 60.0,
                              ),
                            ),
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
