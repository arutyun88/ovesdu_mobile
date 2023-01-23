import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/ui/config/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../data/setting_provider/theme_provider.dart';

class AppMultilineTextField extends StatefulWidget {
  const AppMultilineTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.maxLines = 3,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final int maxLines;

  @override
  State<AppMultilineTextField> createState() => _AppMultilineTextFieldState();
}

class _AppMultilineTextFieldState extends State<AppMultilineTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: widget.maxLines,
        textCapitalization: TextCapitalization.sentences,
        onChanged: widget.onChanged,
        cursorWidth: 1.0,
        cursorHeight: 30.0,
        style:
            Provider.of<ThemeProvider>(context).themeData.textTheme.headline6,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1.0, color: AppColors.orange),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: .5, color: AppColors.orange),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: .5, color: AppColors.orange),
          ),
        ),
      ),
    );
  }
}
