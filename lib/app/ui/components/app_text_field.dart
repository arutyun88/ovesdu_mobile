import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../config/app_colors.dart';
import 'date_text_formatter.dart';
import 'text_formatters.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.focus,
    this.borderColor = AppColors.orange,
    this.controller,
    this.onTap,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.fieldType = TextFieldType.simple,
    this.textAlign = TextAlign.start
  }) : super(key: key);

  final FocusNode? focus;
  final Color borderColor;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final bool obscure;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextFieldType fieldType;
  final TextAlign textAlign;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

enum TextFieldType {
  simple,
  date,
  other,
}

class _AppTextFieldState extends State<AppTextField> {
  late List<TextInputFormatter> formatters;
  late FocusNode node;
  late TextEditingController controller;

  void setFormatters() {
    if (widget.fieldType == TextFieldType.simple) {
      formatters.add(SimpleTextFormatter());
    }
    if(widget.fieldType == TextFieldType.date) {
      formatters.add(DateTextFormatter());
    }
    // if (controller.text.length > 1) {
    // TODO 15 characters?
    // formatters.add(MaskedInputFormatter("###############"));
    // }
  }

  @override
  initState() {
    super.initState();
    formatters = [];
    node = widget.focus ?? FocusNode();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).inputDecorationTheme.hintStyle!;

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: TextField(
        textAlign: widget.textAlign,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure,
        autocorrect: false,
        textCapitalization: widget.textCapitalization,
        // TODO доработать маскирование
        inputFormatters: formatters,
        controller: controller,
        focusNode: node,
        onTap: widget.onTap,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
          setFormatters();
        },
        cursorWidth: 1.0,
        cursorHeight: 20.0,
        cursorColor: labelStyle.color,
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          hintText: widget.hintText,
          hintStyle: labelStyle,
          labelText: widget.labelText,
          labelStyle: labelStyle,
          floatingLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: labelStyle.color,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1.0,
              color: widget.borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: .5,
              color: widget.borderColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: .5,
              color: widget.borderColor.withOpacity(.5),
            ),
          ),
        ),
      ),
    );
  }
}
