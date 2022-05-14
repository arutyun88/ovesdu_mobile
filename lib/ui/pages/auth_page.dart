import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/common/setting_provider/theme_provider.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';
import 'package:ovesdu_mobile/ui/widgets/created_by_widget.dart';
import 'package:ovesdu_mobile/ui/widgets/fields/custom_text_field.dart';
import 'package:ovesdu_mobile/ui/widgets/logo_sliver_delegate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
    if (value.isEmpty) {
      errorText = '';
      isComplete = true;
      enabled = false;
    } else {
      if (value.length < 4) {
        errorText = AppLocalizations.of(context)!.usernameErrorText;
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
    _validate();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
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
                            hintText:
                                AppLocalizations.of(context)!.usernameHint,
                            labelText:
                                AppLocalizations.of(context)!.usernameLabel,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Container(
                                  height: 34,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    errorText,
                                    maxLines: 1,
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .apply(color: AppColors.red),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(flex: 2, child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                minSize: 0,
                                padding: EdgeInsets.zero,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: AppColors.orange,
                                      width: 1.0,
                                    ),
                                    color: enabled
                                        ? AppColors.orange
                                        : AppColors.orange.withOpacity(.2),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.next,
                                    style: TextStyle(
                                      color: enabled
                                          ? Theme.of(context).backgroundColor
                                          : AppColors.orange,
                                    ),
                                  ),
                                ),
                                onPressed: enabled
                                    ? () {
                                        setState(() {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        });
                                        log('next button clicked');
                                      }
                                    : null,
                              ),
                            ],
                          ),
                          Flexible(
                            flex: 4,
                            child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 60.0,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(
                                  AppLocalizations.of(context)!.haveAnAccount,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(fontSize: 14.0),
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
                                child: Text(
                                  AppLocalizations.of(context)!.login,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.orange,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    themeProvider.setTheme();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  });
                                  log('login button clicked');
                                },
                              ),
                              // const LanguagePickerWidget(),
                            ],
                          ),
                          Flexible(
                            flex: 4,
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
