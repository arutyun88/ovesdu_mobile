import 'package:flutter/cupertino.dart';
import 'package:ovesdu_mobile/common/setting_provider/theme_provider.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';
import 'package:ovesdu_mobile/ui/pages/widgets/error_text_widget.dart';
import 'package:ovesdu_mobile/ui/widgets/default_button.dart';
import 'package:ovesdu_mobile/ui/widgets/fields/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsernameWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function() onPressedNext;

  const UsernameWidget({
    Key? key,
    required this.controller,
    required this.onPressedNext,
  }) : super(key: key);

  @override
  _UsernameWidgetState createState() => _UsernameWidgetState();
}

class _UsernameWidgetState extends State<UsernameWidget> {
  late FocusNode _usernameFocus;
  late TextEditingController _usernameController;
  late bool enabled;
  late bool isComplete;
  late String errorText;

  @override
  void initState() {
    super.initState();
    _usernameFocus = FocusNode();
    _usernameController = widget.controller;
    _validate();
  }

  @override
  void dispose() {
    _usernameFocus.dispose();
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _validate();
    return Flexible(
      child: Column(
        children: [
          CustomTextField(
            hintText: AppLocalizations.of(context)!.usernameHint,
            labelText: AppLocalizations.of(context)!.usernameLabel,
            controller: _usernameController,
            focus: _usernameFocus,
            onTap: () => setState(() => _usernameFocus.hasFocus),
            borderColor: isComplete ? AppColors.orange : AppColors.red,
            onChanged: (value) => setState(() => _validate()),
          ),
          ErrorTextWidget(errorText: errorText),
          Flexible(flex: 2, child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DefaultButton(
                title: AppLocalizations.of(context)!.next,
                enable: enabled,
                onPressed: widget.onPressedNext,
              ),
            ],
          ),
          Flexible(
            flex: 4,
            child: Container(
              constraints: const BoxConstraints(minHeight: 60.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  AppLocalizations.of(context)!.haveAnAccount,
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
                  AppLocalizations.of(context)!.login,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.orange,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    themeProvider.setTheme();
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
              ),
              // const LanguagePickerWidget(),
            ],
          ),
          Flexible(
            flex: 4,
            child: Container(
              constraints: const BoxConstraints(minHeight: 60.0),
            ),
          ),
        ],
      ),
    );
  }
}
