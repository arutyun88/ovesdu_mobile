import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../../../config/app_colors.dart';
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
  }) : super(key: key);

  final FocusNode? focus;
  final Color borderColor;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late List<TextInputFormatter> formatters;
  late FocusNode node;
  late TextEditingController controller;

  void setFormatters() {
    formatters.add(SimpleTextFormatter());
    if (controller.text.length > 1) {
      // TODO 15 characters?
      formatters.add(MaskedInputFormatter("###############"));
    }
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
        autocorrect: false,
        textCapitalization: TextCapitalization.none,
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
