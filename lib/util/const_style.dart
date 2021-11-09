import 'package:flutter/material.dart';

class ConstStyle {
  static fontPopins({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight, fontStyle: fontStyle);
}
