import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/const/reg_exr_const.dart';
import '../../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../../../app/ui/components/buttons/default_button.dart';
import '../../domain/state/auth_cubit.dart';
import '../../../../app/ui/components/custom_flex.dart';
import 'error_text_widget.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({
    Key? key,
    required this.username,
    required this.emailController,
    required this.phoneController,
    required this.onTapBack,
    required this.onTapConfirm,
    required this.onTapConfirmWhenCorrect,
  }) : super(key: key);

  final String username;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final Function() onTapBack;
  final Function() onTapConfirm;
  final Function() onTapConfirmWhenCorrect;

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  late bool nextStepEnabled;
  late String _errorText = '';
  late bool _emailIsValid = true;
  late bool _phoneIsValid = true;

  @override
  void initState() {
    super.initState();
    nextStepEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!
                        .helloUsername(widget.username),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: ErrorTextWidget(errorText: _errorText),
                ),
                AppTextField(
                  fieldType: TextFieldType.username,
                  keyboardType: TextInputType.emailAddress,
                  controller: widget.emailController,
                  hintText: AppLocalizations.of(context)!.emailHint,
                  labelText: AppLocalizations.of(context)!.emailLabel,
                  borderColor: _emailIsValid ? AppColors.orange : AppColors.red,
                  onChanged: _emailValidate,
                ),
                const SizedBox(height: 24),
                AppTextField(
                  keyboardType: TextInputType.phone,
                  controller: widget.phoneController,
                  hintText: AppLocalizations.of(context)!.phoneHint,
                  labelText: AppLocalizations.of(context)!.phoneLabel,
                  borderColor: _phoneIsValid ? AppColors.orange : AppColors.red,
                  onChanged: _phoneValidate,
                ),
                const CustomFlex(flex: 4),
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
                        title: AppLocalizations.of(context)!.confirm,
                        enable: nextStepEnabled,
                        onPressed: widget.onTapConfirm,
                      ),
                    ],
                  ),
                ),
                const CustomFlex(flex: 5),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        state.whenOrNull(
            waiting: () => nextStepEnabled = false,
            error: (error) {
              _errorText = error.toString();
              nextStepEnabled = false;
            },
            contactChecked: (correct) {
              if (!correct) {
                _errorText = AppLocalizations.of(context)!.emailOrPhoneExist;
                nextStepEnabled = false;
              } else {
                widget.onTapConfirmWhenCorrect();
              }
            });
      },
    );
  }

  void _emailValidate(String value) {
    setState(() {
      if (value.isNotEmpty) {
        _emailIsValid = RegExp(RegExpConst.email).hasMatch(value);
        if (_emailIsValid) {
          _errorText = '';
        } else {
          _errorText = AppLocalizations.of(context)!.emailNotCorrect;
        }
      } else {
        _errorText = '';
        _emailIsValid = true;
      }
      _checkEnabled();
    });
  }

  // TODO IT
  void _phoneValidate(String value) {
    setState(() {
      if (value.isNotEmpty) {
        if (value.length < 5) {
          _errorText = AppLocalizations.of(context)!.phoneNotCorrect;
          _phoneIsValid = false;
        } else {
          _errorText = '';
          _phoneIsValid = true;
        }
      } else {
        _errorText = '';
        _phoneIsValid = true;
      }
      _checkEnabled();
    });
  }

  void _checkEnabled() {
    nextStepEnabled = widget.emailController.text.isNotEmpty &&
        widget.phoneController.text.isNotEmpty &&
        _emailIsValid &&
        _phoneIsValid;
  }
}
