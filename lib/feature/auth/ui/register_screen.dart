import 'package:domain/entity/device_entity/device_entity.dart';
import 'package:domain/entity/location_entity/location_entity.dart';
import 'package:domain/state/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ovesdu_mobile/app/const/const.dart';
import 'package:ovesdu_mobile/app/ui/components/buttons/theme_button/theme_button.dart';
import 'package:provider/provider.dart';

import '../../../app/const/reg_exr_const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/helpers/app_icons.dart';
import '../../../app/helpers/helpers.dart';
import '../../../app/ui/components/app_scaffold.dart';
import '../../../app/ui/components/buttons/empty_button.dart';
import '../../../app/ui/components/buttons/language_button/language_button.dart';
import '../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../app/ui/components/text_fields/formatter/common.dart';
import '../../../app/ui/components/text_fields/formatter/date_text_formatter.dart';
import '../../../app/ui/config/app_colors.dart';
import '../../../app/ui/components/buttons/default_button.dart';
import '../../location/ui/location_screen.dart';

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
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;
  late final TextEditingController _dateOfBirthController;
  late LocationEntity location;
  late String _locationToString = '';

  late bool _dateIsComplete;
  late bool _dateIsValid = false;
  late bool _firstNameIsComplete;
  late bool _lastNameIsComplete;
  late bool _firstNameIsValid = false;
  late bool _lastNameIsValid = false;
  late bool _locationIsValid = false;
  late bool _passwordIsComplete;
  late bool _passwordIsValid = false;
  late bool _passwordConfirmIsComplete;
  late bool _passwordConfirmIsValid = false;
  late bool _buttonEnabled;
  late final ValueNotifier<List<String>> _notifications = ValueNotifier([]);
  late AppLocalizations _dictionary;
  late String _serverMessage = '';

  late bool _genderSelected = false;
  late bool _isMale;
  late bool _passwordObscure = true;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
    _dateOfBirthController = TextEditingController();

    _firstNameIsComplete = true;
    _lastNameIsComplete = true;
    _dateIsComplete = true;
    _passwordIsComplete = true;
    _passwordConfirmIsComplete = true;
    _buttonValidate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dictionary = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _dateOfBirthController.dispose();
    _notifications.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return BlocListener<AuthCubit, AuthState>(
      child: GestureDetector(
        onTap: () {
          _notificationsRemove(_serverMessage);
          setState(Helpers.unfocused);
        },
        child: AppScaffold(
          notifications: _notifications,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: mainPadding),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: EmptyButton(
                                child: Text(
                                  _dictionary.toStart,
                                  style: theme.textTheme.headline6?.copyWith(
                                    color: AppColors.orange,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {
                                  _notifications.value.clear();
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
                                    name: _dictionary
                                        .registerConfirmedUsernameLabel,
                                    value: widget.username,
                                  ),
                                  _ConfirmedValue(
                                    name:
                                        _dictionary.registerConfirmedEmailLabel,
                                    value: widget.email,
                                  ),
                                  _ConfirmedValue(
                                    name:
                                        _dictionary.registerConfirmedPhoneLabel,
                                    value:
                                        '${widget.phoneNumber} (${widget.phoneCountryCode})',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AppTextField(
                            controller: _firstNameController,
                            hintText: _dictionary.firstNameHint,
                            labelText: _dictionary.firstNameLabel,
                            borderColor: _firstNameIsComplete
                                ? AppColors.orange
                                : AppColors.red,
                            textCapitalization: TextCapitalization.words,
                            onChanged: (value) => setState(_firstNameValidate),
                          ),
                          const SizedBox(height: 12.0),
                          AppTextField(
                            controller: _lastNameController,
                            hintText: _dictionary.lastNameHint,
                            labelText: _dictionary.lastNameLabel,
                            borderColor: _lastNameIsComplete
                                ? AppColors.orange
                                : AppColors.red,
                            textCapitalization: TextCapitalization.words,
                            onChanged: (value) => setState(_lastNameValidate),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => _genderChanged(true),
                                    child: SvgPicture.asset(
                                      AppIcons.maleIcon,
                                      height: 60,
                                      width: 60,
                                      color: _genderSelected
                                          ? _isMale
                                              ? theme.textTheme.headline6?.color
                                              : theme.textTheme.headline6?.color
                                                  ?.withOpacity(.3)
                                          : theme.textTheme.headline6?.color
                                              ?.withOpacity(.1),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _genderChanged(false),
                                    child: SvgPicture.asset(
                                      AppIcons.femaleIcon,
                                      height: 60,
                                      width: 60,
                                      color: _genderSelected
                                          ? !_isMale
                                              ? theme.textTheme.headline6?.color
                                              : theme.textTheme.headline6?.color
                                                  ?.withOpacity(.3)
                                          : theme.textTheme.headline6?.color
                                              ?.withOpacity(.1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          EmptyButton(
                            onPressed: _changeLocation,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical:
                                    _locationToString.isNotEmpty ? 16.0 : 20.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: .5,
                                  color: AppColors.orange,
                                ),
                              ),
                              child: Align(
                                alignment: _locationToString.isNotEmpty
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Text(
                                  _locationToString.isNotEmpty
                                      ? _locationToString
                                      : _dictionary.locationChoose,
                                  textAlign: _locationToString.isNotEmpty
                                      ? TextAlign.start
                                      : TextAlign.end,
                                  style: _locationToString.isNotEmpty
                                      ? theme.textTheme.headline6
                                      : theme.textTheme.headline6?.copyWith(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14.0,
                                          color: theme
                                              .textTheme.headline6?.color
                                              ?.withOpacity(.5),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),
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
                                  controller: _passwordController,
                                  hintText: _dictionary.passwordHint,
                                  labelText: _dictionary.passwordLabel,
                                  borderColor: _passwordIsComplete
                                      ? AppColors.orange
                                      : AppColors.red,
                                  onChanged: (value) =>
                                      setState(_passwordValidate),
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
                          const SizedBox(height: 12.0),
                          AppTextField(
                            fieldType: TextFieldType.password,
                            controller: _passwordConfirmController,
                            hintText: _dictionary.passwordConfirmHint,
                            labelText: _dictionary.passwordConfirmLabel,
                            borderColor: _passwordConfirmIsComplete
                                ? AppColors.orange
                                : AppColors.red,
                            onChanged: (value) =>
                                setState(_passwordConfirmValidate),
                            obscure: _passwordObscure,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
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
                      const Positioned(
                        top: verticalPadding,
                        right: 0,
                        child: LanguageButton(),
                      ),
                      const Positioned(
                        top: verticalPadding,
                        right: mainPadding / 2 + languageButtonSize,
                        child: ThemeButton(),
                      ),
                    ],
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
        _firstNameIsValid &&
        _lastNameIsValid &&
        _passwordIsValid &&
        _passwordConfirmIsValid &&
        _locationIsValid &&
        _genderSelected;
  }

  void _registerOnPressed(AuthCubit authCubit) {
    authCubit.signUp(
      username: widget.username,
      email: widget.email,
      phoneNumber: widget.phoneNumber,
      phoneCountryCode: widget.phoneCountryCode,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      dateOfBirth: _dateOfBirthController.text,
      location: location,
      password: _passwordController.text,
      device: widget.device,
      genderIsMale: _isMale,
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
            location = value as LocationEntity;
            _locationToString = _location(location);
            setState(() {});
            _locationIsValid = true;
            _buttonValidate();
          }
        },
      );

  String _location(LocationEntity location) {
    String city = '';
    String area = '';
    String country = '';
    if (location.city.isNotEmpty) {
      city = location.city;
    }
    if (location.area.isNotEmpty) {
      area = '${city.isNotEmpty ? ', ' : ''}${location.area}';
    }
    if (location.country.isNotEmpty) {
      country = '${area.isNotEmpty ? ', ' : ''}${location.country}';
    }
    return '$city$area$country';
  }

  void _genderChanged(bool value) {
    _notificationsRemove(_serverMessage);
    setState(() {
      if (!_genderSelected) _genderSelected = true;
      _isMale = value;
      _buttonValidate();
    });
  }

  void _firstNameValidate() {
    _notificationsRemove(_serverMessage);
    if (_firstNameController.text.isEmpty) {
      _notificationsRemove(_dictionary.firstNameInvalid);
      _firstNameIsComplete = true;
      _firstNameIsValid = false;
    } else if (_firstNameController.text.length < 2) {
      _notificationsUpdate(_dictionary.firstNameInvalid);
      _firstNameIsComplete = false;
      _firstNameIsValid = false;
    } else {
      _notificationsRemove(_dictionary.firstNameInvalid);
      _firstNameIsComplete = true;
      _firstNameIsValid = true;
    }
    _buttonValidate();
  }

  void _lastNameValidate() {
    _notificationsRemove(_serverMessage);
    if (_lastNameController.text.isEmpty) {
      _notificationsRemove(_dictionary.lastNameInvalid);
      _lastNameIsComplete = true;
      _lastNameIsValid = false;
    } else if (_lastNameController.text.length < 2) {
      _notificationsUpdate(_dictionary.lastNameInvalid);
      _lastNameIsComplete = false;
      _lastNameIsValid = false;
    } else {
      _notificationsRemove(_dictionary.lastNameInvalid);
      _lastNameIsComplete = true;
      _lastNameIsValid = true;
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
      _passwordIsComplete = true;
      _passwordIsValid = false;
    } else {
      if (value.validatePassword()) {
        _notificationsRemove(_dictionary.passwordErrorText);
        _passwordIsComplete = true;
        _passwordIsValid = true;
      } else {
        _notificationsUpdate(_dictionary.passwordErrorText);
        _passwordIsComplete = false;
        _passwordIsValid = false;
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

  void _obscured() => setState(() => _passwordObscure = !_passwordObscure);

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
