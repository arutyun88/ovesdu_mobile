import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/reg_exr_const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/state/auth_cubit.dart';
import '../../../../app/ui/components/buttons/default_button.dart';
import '../../../../app/ui/components/custom_flex.dart';

class UsernameWidget extends StatefulWidget {
  const UsernameWidget({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.isAuth,
    required ValueNotifier<List<String>> notifications,
  })  : _notifications = notifications,
        super(key: key);

  final TextEditingController controller;
  final Function() onTap;
  final ValueNotifier<bool> isAuth;
  final ValueNotifier<List<String>> _notifications;

  @override
  State<UsernameWidget> createState() => _UsernameWidgetState();
}

class _UsernameWidgetState extends State<UsernameWidget> {
  late bool isComplete = true;
  late TextEditingController _usernameController;
  late bool enabled = false;
  late AppLocalizations _dictionary;

  late String serverMessage = '';

  @override
  void initState() {
    super.initState();
    _usernameController = widget.controller;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dictionary = AppLocalizations.of(context)!;
  }

  _validate() {
    _notificationsRemove(serverMessage);
    var value = _usernameController.text.trim();
    if (value.isEmpty) {
      widget._notifications.value = [];
      isComplete = true;
      enabled = false;
    } else {
      if (widget.isAuth.value) {
        if (value.contains('@')) {
          isComplete = RegExp(RegExpConst.email).hasMatch(value);
          if (isComplete) {
            _notificationsRemove(_dictionary.emailNotCorrect);
            enabled = true;
          } else {
            _notificationsUpdate(_dictionary.emailNotCorrect);
            enabled = false;
          }
        } else {
          if (value.length < 4) {
            _notificationsUpdate(_dictionary.usernameErrorText);
            isComplete = false;
            enabled = false;
          } else {
            _notificationsRemove(_dictionary.usernameErrorText);
            isComplete = true;
            enabled = true;
          }
        }
      } else {
        if (value.contains('@') || value.length < 4) {
          if (value.contains('@')) {
            _notificationsUpdate(_dictionary.usernameNotCorrect);
          } else {
            _notificationsRemove(_dictionary.usernameNotCorrect);
          }
          if (value.length < 4) {
            _notificationsUpdate(_dictionary.usernameErrorText);
          } else {
            _notificationsRemove(_dictionary.usernameErrorText);
          }
          isComplete = false;
          enabled = false;
        } else {
          widget._notifications.value = [];
          isComplete = true;
          enabled = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField(
                  controller: _usernameController,
                  fieldType: TextFieldType.username,
                  keyboardType: widget.isAuth.value
                      ? TextInputType.emailAddress
                      : TextInputType.text,
                  hintText: widget.isAuth.value
                      ? _dictionary.usernameOrEmailHint
                      : _dictionary.usernameHint,
                  labelText: widget.isAuth.value
                      ? _dictionary.usernameOrEmailLabel
                      : _dictionary.usernameLabel,
                  borderColor: isComplete ? AppColors.orange : AppColors.red,
                  onChanged: (value) => setState(() => _validate()),
                ),
                const CustomFlex(flex: 2),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    bottom: 48.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DefaultButton(
                        title: _dictionary.next,
                        enable: enabled,
                        onPressed: widget.onTap,
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
                        widget.isAuth.value
                            ? _dictionary.notHaveAnAccount
                            : _dictionary.haveAnAccount,
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodyText2,
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
                        widget.isAuth.value
                            ? _dictionary.register
                            : _dictionary.login,
                        style: theme.textTheme.headline6?.copyWith(
                          color: AppColors.orange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.isAuth.value = !widget.isAuth.value;
                          FocusManager.instance.primaryFocus?.unfocus();
                        });
                      },
                    ),
                  ],
                ),
                const CustomFlex(flex: 5),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        state.whenOrNull(
          waiting: () => enabled = false,
          error: (error) {
            serverMessage = error.message;
            _notificationsUpdate(serverMessage);
            isComplete = false;
          },
          usernameChecked: () {
            _notificationsRemove(serverMessage);
            isComplete = true;
          },
        );
      },
    );
  }

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
