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

class ContactWidget extends StatefulWidget {
  const ContactWidget({
    Key? key,
    required this.username,
    required this.emailController,
    required this.countryCodeController,
    required this.onTapBack,
    required this.onTapConfirm,
    required this.onTapConfirmWhenCorrect,
    required this.phoneNumberNotifier,
    required ValueNotifier<List<String>> notifications,
  })  : _notifications = notifications,
        super(key: key);

  final String username;
  final TextEditingController emailController;

  final TextEditingController countryCodeController;
  final Function() onTapBack;
  final Function() onTapConfirm;
  final Function() onTapConfirmWhenCorrect;
  final ValueNotifier<String> phoneNumberNotifier;

  final ValueNotifier<List<String>> _notifications;

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  late bool nextStepEnabled;
  late bool _emailIsValid = true;
  late bool _phoneIsValid = true;

  late ValueNotifier<Country> _selectedCountryNotifier;
  late AppLocalizations _dictionary;
  late String _serverMessage = '';

  @override
  void initState() {
    super.initState();
    nextStepEnabled = false;
    _selectedCountryNotifier = ValueNotifier(
      countries.firstWhere((country) => country.code == 'AM'),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dictionary = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    _selectedCountryNotifier.dispose();
    super.dispose();
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Align(
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
              _serverMessage = error.message;
              _notificationsUpdate(_serverMessage);
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
    _notificationsRemove(_serverMessage);
    if (value.isNotEmpty) {
      _emailIsValid = RegExp(RegExpConst.email).hasMatch(value);
      if (_emailIsValid) {
        _notificationsRemove(_dictionary.emailNotCorrect);
      } else {
        _notificationsUpdate(_dictionary.emailNotCorrect);
      }
    } else {
      _notificationsRemove(_dictionary.emailNotCorrect);
      _emailIsValid = true;
    }
    _checkEnabled();
  }

  void _phoneValidate(String value) {
    _notificationsRemove(_serverMessage);
    Country country = _selectedCountryNotifier.value;
    if (value.isNotEmpty) {
      if (value.length < country.minLength) {
        _notificationsUpdate(_dictionary.phoneNotCorrect);
        _phoneIsValid = false;
      } else {
        _notificationsRemove(_dictionary.phoneNotCorrect);
        _phoneIsValid = true;
      }
    } else {
      _notificationsRemove(_dictionary.phoneNotCorrect);
      _phoneIsValid = true;
    }
    _checkEnabled();
  }

  void _checkEnabled() {
    setState(
      () => nextStepEnabled = widget.emailController.text.isNotEmpty &&
          widget.phoneNumberNotifier.value.isNotEmpty &&
          _emailIsValid &&
          _phoneIsValid,
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
