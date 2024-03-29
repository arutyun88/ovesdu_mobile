import 'package:domain/state/auth_state/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/const/reg_exr_const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../../app/ui/components/text_fields/formatter/common.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../../../app/ui/components/buttons/default_button.dart';
import '../../../../app/ui/components/custom_flex.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    Key? key,
    required this.username,
    required this.controller,
    required this.onTapBack,
    required this.onTapAuthorize,
    required ValueNotifier<List<String>> notifications,
  })  : _notifications = notifications,
        super(key: key);

  final String username;
  final TextEditingController controller;
  final Function() onTapBack;
  final Function() onTapAuthorize;
  final ValueNotifier<List<String>> _notifications;

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  late bool isComplete = true;
  late bool nextStepEnabled = false;
  late AppLocalizations _dictionary;

  late String serverMessage = '';
  late bool _passwordObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dictionary = AppLocalizations.of(context)!;
  }

  void _validate() {
    _notificationsRemove(serverMessage);
    widget.controller.text = widget.controller.text.trim();
    var value = widget.controller.text;
    widget.controller.selection = updateCursorSelection(value);
    if (value.isEmpty) {
      widget._notifications.value = [];
      isComplete = true;
      nextStepEnabled = false;
    } else {
      if (value.validatePassword()) {
        _notificationsRemove(_dictionary.passwordErrorText);
        isComplete = true;
        nextStepEnabled = true;
      } else {
        _notificationsUpdate(_dictionary.passwordErrorText);
        isComplete = false;
        nextStepEnabled = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return BlocListener<AuthCubit, AuthState>(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.famousUser(widget.username),
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyText2,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        buttonHeight -
                        mainPadding * 2 -
                        verticalPadding,
                    child: AppTextField(
                      fieldType: TextFieldType.password,
                      controller: widget.controller,
                      hintText: AppLocalizations.of(context)!.passwordHint,
                      labelText: AppLocalizations.of(context)!.passwordLabel,
                      borderColor:
                          isComplete ? AppColors.orange : AppColors.red,
                      onChanged: (value) => setState(() => _validate()),
                      obscure: _passwordObscure,
                    ),
                  ),
                  GestureDetector(
                    onTap: _obscured,
                    child: SizedBox(
                      height: buttonHeight,
                      width: buttonHeight,
                      child: Icon(
                        _passwordObscure
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: _passwordObscure
                            ? theme.hintColor
                            : theme.hintColor.withOpacity(.3),
                      ),
                    ),
                  ),
                ],
              ),
              const CustomFlex(flex: 2),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultButton(
                      title: AppLocalizations.of(context)!.back,
                      enable: true,
                      onPressed: widget.onTapBack,
                    ),
                    const SizedBox(width: 10.0),
                    DefaultButton(
                      title: AppLocalizations.of(context)!.authorize,
                      enable: nextStepEnabled,
                      onPressed: widget.onTapAuthorize,
                    ),
                  ],
                ),
              ),
              const CustomFlex(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)!.passwordForgot,
                      textAlign: TextAlign.end,
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Text(
                    AppLocalizations.of(context)!.passwordRecoverButton,
                    style: theme.textTheme.headline6?.copyWith(
                      color: AppColors.orange,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    setState(
                      () => FocusManager.instance.primaryFocus?.unfocus(),
                    );
                  },
                ),
              ),
              const CustomFlex(flex: 5),
            ],
          ),
        ),
      ),
      listener: (context, state) {
        state.whenOrNull(
          waiting: () => nextStepEnabled = false,
          error: (error) {
            serverMessage = error.message;
            _notificationsUpdate(serverMessage);
            isComplete = false;
            nextStepEnabled = true;
          },
          authorized: (value) {
            _notificationsRemove(serverMessage);
          },
        );
      },
    );
  }

  void _obscured() => setState(() => _passwordObscure = !_passwordObscure);

  void _notificationsUpdate(String message) {
    if (!widget._notifications.value.contains(message)) {
      widget._notifications.value.add(message);
      widget._notifications.value =
          widget._notifications.value.map((e) => e).toList();
    }
  }

  void _notificationsRemove(String message) {
    if (widget._notifications.value.contains(message)) {
      widget._notifications.value.remove(message);
      widget._notifications.value =
          widget._notifications.value.map((e) => e).toList();
    }
  }
}
