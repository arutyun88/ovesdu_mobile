import 'package:flutter/material.dart';

TextSelection updateCursorSelection(String text) =>
    TextSelection.fromPosition(TextPosition(offset: text.length));
