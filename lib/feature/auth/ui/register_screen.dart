import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ovesdu_mobile/app/const/reg_exr_const.dart';
import 'package:ovesdu_mobile/app/ui/components/text_fields/formatter/date_text_formatter.dart';

import '../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../app/ui/components/text_fields/formatter/common.dart';
import '../../../app/ui/config/app_colors.dart';
import '../../../app/ui/components/buttons/default_button.dart';
import '../domain/state/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.phoneCountryCode,
    required this.device,
  }) : super(key: key);

  final String username;
  final String email;
  final String phoneNumber;
  final String phoneCountryCode;
  final DeviceEntity device;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;
  late final TextEditingController _dateOfBirthController;
  late final TextEditingController _countryController;
  late final TextEditingController _cityController;

  late String _errorText;
  late bool _dateIsComplete;
  late bool _dateIsValid = false;
  late bool _nameIsComplete;
  late bool _nameIsValid = false;
  late bool _passwordIsComplete;
  late bool _passwordIsValid = false;
  late bool _passwordConfirmIsComplete;
  late bool _passwordConfirmIsValid = false;
  late bool _buttonEnabled;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    _countryController = TextEditingController();
    _cityController = TextEditingController();

    _nameValidate();
    _dateValidate();
    _passwordValidate();
    _passwordConfirmValidate();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _dateOfBirthController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => setState(() => _unfocused()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            dictionary.toStart,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.orange,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ConfirmedValue(
                            name: dictionary.registerConfirmedUsernameLabel,
                            value: widget.username,
                          ),
                          _ConfirmedValue(
                            name: dictionary.registerConfirmedEmailLabel,
                            value: widget.email,
                          ),
                          _ConfirmedValue(
                            name: dictionary.registerConfirmedPhoneLabel,
                            value:
                                '${widget.phoneNumber} (${widget.phoneCountryCode})',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    AppTextField(
                      controller: _nameController,
                      hintText: dictionary.nameHint,
                      labelText: dictionary.nameLabel,
                      borderColor:
                          _nameIsComplete ? AppColors.orange : AppColors.red,
                      textCapitalization: TextCapitalization.words,
                      onChanged: (value) => setState(_nameValidate),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 160,
                          child: AppTextField(
                            fieldType: TextFieldType.date,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: _dateOfBirthController,
                            borderColor: _dateIsComplete
                                ? AppColors.orange
                                : AppColors.red,
                            hintText: dictionary.dateOfBirthLabel,
                            labelText: dictionary.dateOfBirthLabel,
                            onChanged: (value) => setState(_dateValidate),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    AppTextField(
                      controller: _countryController,
                      hintText: dictionary.countryLabel,
                      labelText: dictionary.countryLabel,
                      onChanged: (value) => setState(() {}),
                    ),
                    const SizedBox(height: 12.0),
                    AppTextField(
                      controller: _cityController,
                      hintText: dictionary.cityLabel,
                      labelText: dictionary.cityLabel,
                      onChanged: (value) => setState(() {}),
                    ),
                    const SizedBox(height: 24.0),
                    AppTextField(
                      fieldType: TextFieldType.password,
                      controller: _passwordController,
                      hintText: dictionary.passwordHint,
                      labelText: dictionary.passwordLabel,
                      borderColor: _passwordIsComplete
                          ? AppColors.orange
                          : AppColors.red,
                      onChanged: (value) => setState(_passwordValidate),
                    ),
                    const SizedBox(height: 12.0),
                    AppTextField(
                      fieldType: TextFieldType.password,
                      controller: _passwordConfirmController,
                      hintText: dictionary.passwordConfirmHint,
                      labelText: dictionary.passwordConfirmLabel,
                      borderColor: _passwordConfirmIsComplete
                          ? AppColors.orange
                          : AppColors.red,
                      onChanged: (value) => setState(_passwordConfirmValidate),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: DefaultButton(
                          title: dictionary.register,
                          enable: _buttonEnabled,
                          onPressed: () {
                            _registerOnPressed(context.read<AuthCubit>());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        state.whenOrNull(
          waiting: () => _buttonEnabled = false,
          authorized: (entity) {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _buttonValidate() {
    _buttonEnabled = _dateIsValid &&
        _nameIsValid &&
        _passwordIsValid &&
        _passwordConfirmIsValid;
  }

  void _registerOnPressed(AuthCubit authCubit) {
    authCubit.signUp(
      username: widget.username,
      email: widget.email,
      phoneNumber: widget.phoneNumber,
      name: _nameController.text,
      dateOfBirth: _dateOfBirthController.text,
      country: _countryController.text,
      city: _cityController.text,
      password: _passwordController.text,
      device: widget.device,
    );
  }

  void _nameValidate() {
    if (_nameController.text.isEmpty) {
      _errorText = '\n';
      _nameIsComplete = true;
      _nameIsValid = false;
    } else if (_nameController.text.trim().split(' ').length < 2) {
      _errorText = AppLocalizations.of(context)!.nameInvalid;
      _nameIsComplete = false;
      _nameIsValid = false;
    } else {
      _errorText = '\n';
      _nameIsComplete = true;
      _nameIsValid = true;
    }
  }

  void _dateValidate() {
    if (_dateOfBirthController.text.isEmpty) {
      _errorText = '\n';
      _dateIsComplete = true;
      _dateIsValid = false;
    } else if (_dateOfBirthController.text.length != 10) {
      _errorText = AppLocalizations.of(context)!.dateInvalid;
      _dateIsComplete = false;
      _dateIsValid = false;
    } else {
      var temp = _dateOfBirthController.text
          .split('/')
          .map((e) => int.parse(e))
          .toList();
      var date = DateTime(temp[2], temp[1], temp[0]);
      if (date.isUnderage()) {
        _errorText = AppLocalizations.of(context)!.isUnderage;
        _dateIsComplete = false;
        _dateIsValid = false;
      } else {
        _errorText = '\n';
        _dateIsComplete = true;
        _dateIsValid = true;
      }
    }
    _buttonValidate();
  }

  void _passwordValidate() {
    _passwordController.text = _passwordController.text.trim();
    var value = _passwordController.text;
    _passwordController.selection = updateCursorSelection(value);
    if (value.isEmpty) {
      _errorText = '\n';
      _passwordIsComplete = true;
      _passwordIsValid = false;
    } else {
      if (value.length < 8) {
        _errorText = AppLocalizations.of(context)!.passwordErrorText;
        _passwordIsComplete = false;
        _passwordIsValid = false;
      } else {
        if (value.validatePassword()) {
          _errorText = '\n';
          _passwordIsComplete = true;
          _passwordIsValid = true;
        } else {
          _errorText = AppLocalizations.of(context)!.passwordNotCorrect;
          _passwordIsComplete = false;
          _passwordIsValid = false;
        }
      }
    }
    _passwordConfirmValidate();
    _buttonValidate();
  }

  void _passwordConfirmValidate() {
    if (_passwordController.text.isNotEmpty) {
      if (_passwordConfirmController.text.isEmpty) {
        _errorText = AppLocalizations.of(context)!.passwordNotCorrect;
        _passwordConfirmIsComplete = false;
        _passwordConfirmIsValid = false;
      } else {
        if (_passwordController.text == _passwordConfirmController.text) {
          _errorText = '\n';
          _passwordConfirmIsComplete = true;
          _passwordConfirmIsValid = true;
        } else {
          _errorText = AppLocalizations.of(context)!.passwordNotMatch;
          _passwordConfirmIsComplete = false;
          _passwordConfirmIsValid = false;
        }
      }
    } else {
      _errorText = '\n';
      _passwordConfirmIsComplete = true;
      _passwordConfirmIsValid = false;
    }
    _buttonValidate();
  }

  void _unfocused() => FocusManager.instance.primaryFocus?.unfocus();
}

class _ConfirmedValue extends StatelessWidget {
  const _ConfirmedValue({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$name: ',
            style: const TextStyle(
              color: AppColors.unselectedItemColor,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: AppColors.greenLight,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
