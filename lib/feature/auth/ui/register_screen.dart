import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../app/const/reg_exr_const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../app/helpers/helpers.dart';
import '../../../app/ui/components/app_scaffold.dart';
import '../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../app/ui/components/text_fields/formatter/common.dart';
import '../../../app/ui/components/text_fields/formatter/date_text_formatter.dart';
import '../../../app/ui/config/app_colors.dart';
import '../../../app/ui/components/buttons/default_button.dart';
import '../../location/domain/entities/location_entity/location_entity.dart';
import '../../location/ui/location_screen.dart';
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

  late bool _dateIsComplete;
  late bool _dateIsValid = false;
  late bool _nameIsComplete;
  late bool _nameIsValid = false;
  late bool _locationIsValid = false;
  late bool _passwordIsComplete;
  late bool _passwordIsValid = false;
  late bool _passwordConfirmIsComplete;
  late bool _passwordConfirmIsValid = false;
  late bool _buttonEnabled;
  late final ValueNotifier<List<String>> _notifications = ValueNotifier([]);
  late AppLocalizations _dictionary;
  late String _serverMessage = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    _countryController = TextEditingController();
    _cityController = TextEditingController();

    _nameIsComplete = true;
    _nameIsValid = false;
    _dateIsComplete = true;
    _dateIsValid = false;
    _locationIsValid = false;
    _passwordIsComplete = true;
    _passwordIsValid = false;
    _passwordConfirmIsComplete = true;
    _passwordConfirmIsValid = true;
    _buttonValidate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dictionary = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _dateOfBirthController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _notifications.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return BlocListener<AuthCubit, AuthState>(
      child: AppScaffold(
        notifications: _notifications,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => setState(Helpers.unfocused),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: Text(
                          _dictionary.toStart,
                          style: theme.textTheme.headline6?.copyWith(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ConfirmedValue(
                            name: _dictionary.registerConfirmedUsernameLabel,
                            value: widget.username,
                          ),
                          _ConfirmedValue(
                            name: _dictionary.registerConfirmedEmailLabel,
                            value: widget.email,
                          ),
                          _ConfirmedValue(
                            name: _dictionary.registerConfirmedPhoneLabel,
                            value:
                                '${widget.phoneNumber} (${widget.phoneCountryCode})',
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppTextField(
                    controller: _nameController,
                    hintText: _dictionary.nameHint,
                    labelText: _dictionary.nameLabel,
                    borderColor:
                        _nameIsComplete ? AppColors.orange : AppColors.red,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) => setState(_nameValidate),
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 180,
                        child: AppTextField(
                          fieldType: TextFieldType.date,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          controller: _dateOfBirthController,
                          borderColor: _dateIsComplete
                              ? AppColors.orange
                              : AppColors.red,
                          hintText: _dictionary.dateOfBirthLabel,
                          labelText: _dictionary.dateOfBirthLabel,
                          onChanged: (value) => setState(_dateValidate),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  AppTextField(
                    controller: _countryController,
                    hintText: _dictionary.countryHint,
                    borderColor: AppColors.orange,
                    onTap: _changeLocation,
                    readOnly: true,
                  ),
                  const SizedBox(height: 12.0),
                  AppTextField(
                    controller: _cityController,
                    hintText: _dictionary.cityHint,
                    borderColor: AppColors.orange,
                    readOnly: true,
                    onTap: _changeLocation,
                  ),
                  const SizedBox(height: 24.0),
                  AppTextField(
                    fieldType: TextFieldType.password,
                    controller: _passwordController,
                    hintText: _dictionary.passwordHint,
                    labelText: _dictionary.passwordLabel,
                    borderColor:
                        _passwordIsComplete ? AppColors.orange : AppColors.red,
                    onChanged: (value) => setState(_passwordValidate),
                  ),
                  const SizedBox(height: 12.0),
                  AppTextField(
                    fieldType: TextFieldType.password,
                    controller: _passwordConfirmController,
                    hintText: _dictionary.passwordConfirmHint,
                    labelText: _dictionary.passwordConfirmLabel,
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
                        title: _dictionary.register,
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
      ),
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {
            _serverMessage = error.message;
            _notificationsUpdate(_serverMessage);
          },
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
        _passwordConfirmIsValid &&
        _locationIsValid;
  }

  void _registerOnPressed(AuthCubit authCubit) {
    authCubit.signUp(
      username: widget.username,
      email: widget.email,
      phoneNumber: widget.phoneNumber,
      phoneCountryCode: widget.phoneCountryCode,
      name: _nameController.text,
      dateOfBirth: _dateOfBirthController.text,
      country: _countryController.text,
      city: _cityController.text,
      password: _passwordController.text,
      device: widget.device,
    );
  }

  void _changeLocation() => Navigator.of(context)
          .push(
        MaterialPageRoute(
          builder: (context) => const LocationScreen(),
        ),
      )
          .then(
        (value) {
          Helpers.unfocused();
          if (value != null) {
            var location = value as LocationEntity;
            _cityController.text = location.city;
            _countryController.text = location.country;
            _locationValidate();
          }
        },
      );

  void _nameValidate() {
    _notificationsRemove(_serverMessage);
    if (_nameController.text.isEmpty) {
      _notificationsRemove(_dictionary.nameInvalid);
      _nameIsComplete = true;
      _nameIsValid = false;
    } else if (_nameController.text.trim().split(' ').length < 2) {
      _notificationsUpdate(_dictionary.nameInvalid);
      _nameIsComplete = false;
      _nameIsValid = false;
    } else {
      _notificationsRemove(_dictionary.nameInvalid);
      _nameIsComplete = true;
      _nameIsValid = true;
    }
  }

  void _locationValidate() {
    _notificationsRemove(_serverMessage);
    if (_countryController.text.isEmpty || _cityController.text.isEmpty) {
      _notificationsRemove(_dictionary.countryInvalid);
      _locationIsValid = false;
    } else {
      _notificationsRemove(_dictionary.countryInvalid);
      _locationIsValid = true;
    }
    _buttonValidate();
  }

  void _dateValidate() {
    _notificationsRemove(_serverMessage);
    if (_dateOfBirthController.text.isEmpty) {
      _notificationsRemove(_dictionary.dateInvalid);
      _dateIsComplete = true;
      _dateIsValid = false;
    } else if (_dateOfBirthController.text.length != 10) {
      _notificationsRemove(_dictionary.isUnderage);
      _notificationsUpdate(_dictionary.dateInvalid);
      _dateIsComplete = false;
      _dateIsValid = false;
    } else {
      var temp = _dateOfBirthController.text
          .split('/')
          .map((e) => int.parse(e))
          .toList();
      var date = DateTime(temp[2], temp[1], temp[0]);
      if (date.isUnderage()) {
        _notificationsRemove(_dictionary.dateInvalid);
        _notificationsUpdate(_dictionary.isUnderage);
        _dateIsComplete = false;
        _dateIsValid = false;
      } else {
        _notificationsRemove(_dictionary.isUnderage);
        _notificationsRemove(_dictionary.dateInvalid);
        _dateIsComplete = true;
        _dateIsValid = true;
      }
    }
    _buttonValidate();
  }

  void _passwordValidate() {
    _notificationsRemove(_serverMessage);
    _passwordController.text = _passwordController.text.trim();
    var value = _passwordController.text;
    _passwordController.selection = updateCursorSelection(value);
    if (value.isEmpty) {
      _notificationsRemove(_dictionary.passwordErrorText);
      _notificationsRemove(_dictionary.passwordNotCorrect);
      _passwordIsComplete = true;
      _passwordIsValid = false;
    } else {
      if (value.length < 8) {
        _notificationsUpdate(_dictionary.passwordErrorText);
        _notificationsRemove(_dictionary.passwordNotCorrect);
        _passwordIsComplete = false;
        _passwordIsValid = false;
      } else {
        _notificationsRemove(_dictionary.passwordErrorText);
        if (value.validatePassword()) {
          _notificationsRemove(_dictionary.passwordNotCorrect);
          _passwordIsComplete = true;
          _passwordIsValid = true;
        } else {
          _notificationsUpdate(_dictionary.passwordNotCorrect);
          _passwordIsComplete = false;
          _passwordIsValid = false;
        }
      }
    }
    _passwordConfirmValidate();
    _buttonValidate();
  }

  void _passwordConfirmValidate() {
    _notificationsRemove(_serverMessage);
    if (_passwordController.text.isNotEmpty) {
      if (_passwordController.text == _passwordConfirmController.text) {
        _notificationsRemove(_dictionary.passwordNotMatch);
        _passwordConfirmIsComplete = true;
        _passwordConfirmIsValid = true;
      } else {
        _notificationsUpdate(_dictionary.passwordNotMatch);
        _passwordConfirmIsComplete = false;
        _passwordConfirmIsValid = false;
      }
    } else {
      _notificationsRemove(_dictionary.passwordNotMatch);
      _passwordConfirmIsComplete = true;
      _passwordConfirmIsValid = false;
    }
    _buttonValidate();
  }

  void _notificationsUpdate(String message) {
    if (!_notifications.value.contains(message)) {
      _notifications.value.add(message);
      _notifications.value = _notifications.value.map((e) => e).toList();
    }
  }

  void _notificationsRemove(String message) {
    if (_notifications.value.contains(message)) {
      _notifications.value.remove(message);
      _notifications.value = _notifications.value.map((e) => e).toList();
    }
  }
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
    final theme = Provider.of<ThemeProvider>(context).themeData.textTheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$name: ',
            style: theme.bodyText2?.copyWith(
              color: AppColors.unselectedItemColor,
            ),
          ),
          TextSpan(
            text: value,
            style: theme.bodyText1?.copyWith(
              color: AppColors.greenLight,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
