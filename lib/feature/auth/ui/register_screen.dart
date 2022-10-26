import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/ui/components/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
    required this.username,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  final String username;
  final String email;
  final String phoneNumber;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.username),
                      Text(widget.email),
                      Text(widget.phoneNumber),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                AppTextField(
                  obscure: true,
                  controller: TextEditingController(),
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  labelText: AppLocalizations.of(context)!.passwordLabel,
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 24.0),
                AppTextField(
                  obscure: true,
                  controller: TextEditingController(),
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  labelText: AppLocalizations.of(context)!.passwordLabel,
                  onChanged: (value) => setState(() {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
