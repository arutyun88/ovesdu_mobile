import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../../../config/app_colors.dart';
import 'text_formatters.dart';

class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    FocusNode? focus,
    this.borderColor = AppColors.orange,
    TextEditingController? controller,
    this.onTap,
    this.onChanged,
    this.hintText = '',
    this.labelText = '',
  })  : focusNode = focus ?? FocusNode(),
        textController = controller ?? TextEditingController(),
        super(key: key);

  final FocusNode focusNode;
  final Color borderColor;
  final TextEditingController textController;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String hintText;
  final String labelText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late List<TextInputFormatter> formatters = [];

  void setFormatters() {
    formatters.add(SimpleTextFormatter());
    if (widget.textController.text.length > 1) {
      // TODO 15 characters?
      formatters.add(MaskedInputFormatter("###############"));
    }
  }

  @override
  Widget build(BuildContext context) {
    final hintStyle = Theme.of(context).inputDecorationTheme.hintStyle!;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: widget.focusNode.hasFocus ? 1.0 : .5,
              color: widget.borderColor,
            ),
          ),
          padding: EdgeInsets.all(widget.focusNode.hasFocus ? 11.0 : 11.5),
          child: TextField(
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            // TODO доработать маскирование
            inputFormatters: formatters,
            controller: widget.textController,
            focusNode: widget.focusNode,
            onTap: widget.onTap ??
                () => setState(
                      () => widget.focusNode.hasFocus,
                    ),
            onChanged: widget.onChanged ??
                (value) => setState(
                      () => setFormatters(),
                    ),
            cursorWidth: 1.0,
            cursorHeight: 20.0,
            cursorColor: hintStyle.color,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              hintText: widget.hintText,
              hintStyle: hintStyle,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        if (widget.textController.text.isNotEmpty)
          Positioned(
            top: 0.0,
            left: 14.0,
            child: Container(
              height: 18,
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              color: Theme.of(context).backgroundColor,
              child: Text(
                widget.labelText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: hintStyle.color,
                ),
              ),
            ),
          )
      ],
    );
  }
}
