import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.loginFocus,
    required this.onTap,
    required this.onChanged,
    required this.controller,
    required this.borderColor,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final FocusNode loginFocus;
  final Function() onTap;
  final Function(String) onChanged;
  final TextEditingController controller;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final hintStyle = Theme.of(context).inputDecorationTheme.hintStyle!;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: loginFocus.hasFocus ? 1.0 : .5,
              color: borderColor,
            ),
          ),
          padding: EdgeInsets.all(loginFocus.hasFocus ? 12.0 : 12.5),
          child: TextField(
            controller: controller,
            focusNode: loginFocus,
            onTap: onTap,
            onChanged: onChanged,
            cursorWidth: 1.0,
            cursorHeight: 27.0,
            cursorColor: hintStyle.color,
            style: Theme.of(context).textTheme.headline5,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              hintText: hintText,
              hintStyle: hintStyle,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: .5, color: hintStyle.color!),
              ),
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        loginFocus.hasFocus
            ? Positioned(
                top: 0.0,
                left: 14.0,
                child: Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  color: AppColors.lightBackground,
                  child: Text(
                    labelText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: hintStyle.color,
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
