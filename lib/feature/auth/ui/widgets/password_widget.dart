import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ovesdu_mobile/app/const/reg_exr_const.dart';
import 'package:ovesdu_mobile/app/ui/components/text_fields/formatter/common.dart';

import '../../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../../../app/ui/components/buttons/default_button.dart';
import '../../domain/state/auth_cubit.dart';
import '../../../../app/ui/components/custom_flex.dart';
import 'error_text_widget.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    Key? key,
    required this.username,
    required this.controller,
    required this.onTapBack,
    required this.onTapAuthorize,
  }) : super(key: key);

  final String username;
  final TextEditingController controller;
  final Function() onTapBack;
  final Function() onTapAuthorize;

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  late bool isComplete;
  late String errorText = '';
  late bool nextStepEnabled;

  late final String passwordErrorText;

  @override
  void initState() {
    super.initState();
    _validate();
  }

  void _validate() {
    widget.controller.text = widget.controller.text.trim();
    var value = widget.controller.text;
    widget.controller.selection = updateCursorSelection(value);
    if (value.isEmpty) {
      errorText = '\n';
      isComplete = true;
      nextStepEnabled = false;
    } else {
      if (value.length < 8) {
        errorText = AppLocalizations.of(context)!.passwordErrorText;
        isComplete = false;
        nextStepEnabled = false;
      } else {
        if (value.validatePassword()) {
          errorText = '\n';
          isComplete = true;
          nextStepEnabled = true;
        } else {
          errorText = AppLocalizations.of(context)!.passwordNotCorrect;
          isComplete = false;
          nextStepEnabled = false;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.famousUser(widget.username),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
                ErrorTextWidget(errorText: errorText),
                AppTextField(
                  fieldType: TextFieldType.password,
                  controller: widget.controller,
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  labelText: AppLocalizations.of(context)!.passwordLabel,
                  borderColor: isComplete ? AppColors.orange : AppColors.red,
                  onChanged: (value) => setState(() => _validate()),
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
                        style: const TextStyle(fontSize: 14.0),
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
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.orange,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        FocusManager.instance.primaryFocus?.unfocus();
                      });
                    },
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
            errorText = error.toString();
            isComplete = false;
          },
        );
      },
    );
  }
}
