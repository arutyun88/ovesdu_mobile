import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/ui/components/app_text_field.dart';
import '../../../../config/app_colors.dart';
import 'error_text_widget.dart';
import '../../../../ui/widgets/default_button.dart';
import 'custom_flex.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({
    Key? key,
    this.auth = true,
    required this.controller,
    required this.onTap,
    required this.buttonEnabled,
  }) : super(key: key);

  final bool auth;
  final TextEditingController controller;
  final Function() onTap;
  final bool buttonEnabled;

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
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

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  _validate() {
    var value = _usernameController.text.trim();
    if (value.isEmpty) {
      errorText = '';
      isComplete = true;
      enabled = false;
    } else {
      if (value.length < 4) {
        errorText = AppLocalizations.of(context)!.usernameErrorText;
        isComplete = false;
        enabled = false;
      } else {
        errorText = '';
        isComplete = true;
        enabled = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              hintText: AppLocalizations.of(context)!.usernameOrEmailHint,
              labelText: AppLocalizations.of(context)!.usernameOrEmailLabel,
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
                    enable: enabled && widget.buttonEnabled,
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
                    widget.auth
                        ? AppLocalizations.of(context)!.notHaveAnAccount
                        : AppLocalizations.of(context)!.haveAnAccount,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: Text(
                      widget.auth
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
                        // themeProvider.setTheme();
                        FocusManager.instance.primaryFocus?.unfocus();
                      });
                    },
                  ),
                  // const LanguagePickerWidget(),
                ],
              ),
            ),
            const CustomFlex(flex: 3),
          ],
        ),
      ),
    );
  }
}
