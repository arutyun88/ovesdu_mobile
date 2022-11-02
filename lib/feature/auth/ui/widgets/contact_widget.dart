import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/countries.dart';
import '../../../../app/const/reg_exr_const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/components/text_fields/app_phone_field/app_phone_field.dart';
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
    // required this.phoneController,
    required this.countryCodeController,
    required this.onTapBack,
    required this.onTapConfirm,
    required this.onTapConfirmWhenCorrect,
    required this.phoneNumberNotifier,
  }) : super(key: key);

  final String username;
  final TextEditingController emailController;

  // final TextEditingController phoneController;
  final TextEditingController countryCodeController;
  final Function() onTapBack;
  final Function() onTapConfirm;
  final Function() onTapConfirmWhenCorrect;
  final ValueNotifier<String> phoneNumberNotifier;

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  late bool nextStepEnabled;
  late String _errorText = '';
  late bool _emailIsValid = true;
  late bool _phoneIsValid = true;

  // late ValueNotifier<String> _phoneNotifier;
  late ValueNotifier<Country> _selectedCountryNotifier;

  @override
  void initState() {
    super.initState();
    nextStepEnabled = false;
    // _phoneNotifier = widget.phoneNumberNotifier;
    _selectedCountryNotifier = ValueNotifier(
      countries.firstWhere((country) => country.code == 'AM'),
    );
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
                    style: Provider.of<ThemeProvider>(context)
                        .themeData
                        .textTheme
                        .bodyText2,
                  ),
                ),
                ErrorTextWidget(errorText: _errorText),
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
                AppPhoneField(
                  hintText: AppLocalizations.of(context)!.phoneHint,
                  labelText: AppLocalizations.of(context)!.phoneLabel,
                  borderColor: _phoneIsValid ? AppColors.orange : AppColors.red,
                  onChanged: _phoneValidate,
                  phone: widget.phoneNumberNotifier,
                  selectedCountryNotifier: _selectedCountryNotifier,
                  otherFunction: _checkEnabled,
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
              _errorText = error.message;
              nextStepEnabled = false;
            },
            contactChecked: () {
              widget.countryCodeController.text =
                  _selectedCountryNotifier.value.code;
              widget.onTapConfirmWhenCorrect();
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

  void _phoneValidate(String value) {
    Country country = _selectedCountryNotifier.value;
    setState(() {
      if (value.isNotEmpty) {
        if (value.length < country.minLength) {
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
    setState(
      () => nextStepEnabled = widget.emailController.text.isNotEmpty &&
          widget.phoneNumberNotifier.value.isNotEmpty &&
          _emailIsValid &&
          _phoneIsValid,
    );
  }
}
