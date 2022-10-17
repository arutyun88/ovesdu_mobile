import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';
import 'package:ovesdu_mobile/feature/auth/ui/widgets/error_text_widget.dart';
import 'package:ovesdu_mobile/ui/widgets/default_button.dart';
import 'package:ovesdu_mobile/ui/widgets/fields/custom_text_field.dart';

class RegisterInfoWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final Function() onPressedBack;
  final Function() onPressedNext;

  const RegisterInfoWidget({
    Key? key,
    required this.emailController,
    required this.phoneController,
    required this.onPressedBack,
    required this.onPressedNext,
  }) : super(key: key);

  @override
  _RegisterInfoWidgetState createState() => _RegisterInfoWidgetState();
}

class _RegisterInfoWidgetState extends State<RegisterInfoWidget> {
  late FocusNode _emailFocus;
  late FocusNode _phoneFocus;

  late bool emailIsEnabled;
  late bool phoneIsEnabled;
  late bool nextButtonIsComplete;

  late bool emailIsComplete;
  late bool phoneIsComplete;

  late String emailErrorText;
  late String phoneErrorText;

  @override
  void initState() {
    super.initState();
    _emailFocus = FocusNode();
    _phoneFocus = FocusNode();
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  // TODO сделать правильную валидацию
  _validate() {
    var emailValue = widget.emailController.text.trim();
    if (emailValue.isEmpty) {
      emailErrorText = '';
      emailIsComplete = true;
      emailIsEnabled = false;
    } else {
      if (emailValue.length < 4) {
        emailErrorText = AppLocalizations.of(context)!.emailIsUseErrorText;
        emailIsComplete = false;
        emailIsEnabled = false;
      } else {
        emailErrorText = '';
        emailIsComplete = true;
        emailIsEnabled = true;
      }
    }
    var phoneValue = widget.phoneController.text.trim();
    if (phoneValue.isEmpty) {
      phoneErrorText = '';
      phoneIsComplete = true;
      phoneIsEnabled = false;
    } else {
      if (phoneValue.length < 4) {
        phoneErrorText = AppLocalizations.of(context)!.phoneIsUseErrorText;
        phoneIsComplete = false;
        phoneIsEnabled = false;
      } else {
        phoneErrorText = '';
        phoneIsComplete = true;
        phoneIsEnabled = true;
      }
    }

    nextButtonIsComplete = emailIsEnabled && phoneIsEnabled;
  }

  @override
  Widget build(BuildContext context) {
    _validate();
    return Column(
      children: [
        CustomTextField(
          hintText: AppLocalizations.of(context)!.emailHint,
          labelText: AppLocalizations.of(context)!.emailLabel,
          controller: widget.emailController,
          focus: _emailFocus,
          onTap: () => setState(() => _emailFocus.hasFocus),
          borderColor: emailIsComplete ? AppColors.orange : AppColors.red,
          onChanged: (value) => setState(() => _validate()),
        ),
        ErrorTextWidget(errorText: emailErrorText),
        CustomTextField(
          hintText: AppLocalizations.of(context)!.phoneHint,
          labelText: AppLocalizations.of(context)!.phoneLabel,
          controller: widget.phoneController,
          focus: _phoneFocus,
          onTap: () => setState(() => _phoneFocus.hasFocus),
          borderColor: phoneIsComplete ? AppColors.orange : AppColors.red,
          onChanged: (value) => setState(() => _validate()),
        ),
        ErrorTextWidget(errorText: phoneErrorText),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultButton(
              title: AppLocalizations.of(context)!.back,
              enable: true,
              onPressed: widget.onPressedBack,
            ),
            DefaultButton(
              title: AppLocalizations.of(context)!.next,
              enable: nextButtonIsComplete,
              onPressed: widget.onPressedNext,
            ),
          ],
        ),
      ],
    );
  }
}
