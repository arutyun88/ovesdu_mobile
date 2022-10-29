import 'package:flutter/services.dart';

import 'common.dart';

class UsernameTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    oldValue.selection;
    var text = newValue.text.trim().toLowerCase().replaceAll(' ', '');
    return TextEditingValue(
      text: text,
      selection: updateCursorSelection(text),
    );
  }
}
