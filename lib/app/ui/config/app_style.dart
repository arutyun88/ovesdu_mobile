import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextStyleGoogleFonts on TextStyle {
  TextStyle withStyle(TextStyle? style) => GoogleFonts.ptSans(
        textStyle: style,
      );

  TextStyle withColor(Color? color) => GoogleFonts.ptSans(
        color: color,
      );

  TextStyle withSize(double size) => GoogleFonts.ptSans(
        fontSize: size,
      );
}
