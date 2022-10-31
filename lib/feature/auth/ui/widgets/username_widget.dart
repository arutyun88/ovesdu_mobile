import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/const/reg_exr_const.dart';
import '../../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/state/auth_cubit.dart';
import 'error_text_widget.dart';
import '../../../../app/ui/components/buttons/default_button.dart';
import '../../../../app/ui/components/custom_flex.dart';

class UsernameWidget extends StatefulWidget {
  const UsernameWidget({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.isAuth,
  }) : super(key: key);

  final TextEditingController controller;
  final Function() onTap;
  final ValueNotifier<bool> isAuth;

  @override
  State<UsernameWidget> createState() => _UsernameWidgetState();
}

class _UsernameWidgetState extends State<UsernameWidget> {
  late bool isComplete;
  late TextEditingController _usernameController;
  late bool enabled;
  late String errorText;

  @override
  void initState() {
    super.initState();
    _usernameController = widget.controller;
    _validate();
  }

  _validate() {
    var value = _usernameController.text.trim();
    if (value.isEmpty) {
      errorText = '\n';
      isComplete = true;
      enabled = false;
    } else {
      if (widget.isAuth.value) {
        if (value.contains('@')) {
          isComplete = RegExp(RegExpConst.email).hasMatch(value);
          if (isComplete) {
            errorText = '\n';
            enabled = true;
          } else {
            errorText = AppLocalizations.of(context)!.emailNotCorrect;
            enabled = false;
          }
        } else {
          if (value.length < 4) {
            errorText = AppLocalizations.of(context)!.usernameErrorText;
            isComplete = false;
            enabled = false;
          } else {
            errorText = '\n';
            isComplete = true;
            enabled = true;
          }
        }
      } else {
        if (value.contains('@')) {
          errorText = AppLocalizations.of(context)!.usernameNotCorrect;
          isComplete = false;
          enabled = false;
        } else if (value.length < 4) {
          errorText = AppLocalizations.of(context)!.usernameErrorText;
          isComplete = false;
          enabled = false;
        } else {
          errorText = '\n';
          isComplete = true;
          enabled = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ErrorTextWidget(errorText: errorText),
                AppTextField(
                  controller: _usernameController,
                  fieldType: TextFieldType.username,
                  keyboardType: widget.isAuth.value
                      ? TextInputType.emailAddress
                      : TextInputType.text,
                  hintText: widget.isAuth.value
                      ? AppLocalizations.of(context)!.usernameOrEmailHint
                      : AppLocalizations.of(context)!.usernameHint,
                  labelText: widget.isAuth.value
                      ? AppLocalizations.of(context)!.usernameOrEmailLabel
                      : AppLocalizations.of(context)!.usernameLabel,
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
                        title: AppLocalizations.of(context)!.next,
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
                            ? AppLocalizations.of(context)!.notHaveAnAccount
                            : AppLocalizations.of(context)!.haveAnAccount,
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
                        widget.isAuth.value
                            ? AppLocalizations.of(context)!.register
                            : AppLocalizations.of(context)!.login,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.orange,
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
            errorText = error.message;
            isComplete = false;
          },
          usernameChecked: (value) {
            if (!value) {
              errorText = AppLocalizations.of(context)!.usernameAlreadyExist;
            }
            isComplete = value;
          },
        );
      },
    );
  }
}
