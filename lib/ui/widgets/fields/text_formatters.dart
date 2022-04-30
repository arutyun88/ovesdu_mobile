import 'package:flutter/services.dart';

class SimpleTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.replaceAll(' ', '').toLowerCase(),
      selection: newValue.selection,
    );
  }
}
