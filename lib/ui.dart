import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
    required double size,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xfffacf5a))),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xfffacf5a), width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
            color: const Color(0xfffacf5a),
            fontSize: size * 0.7,
            fontWeight: FontWeight.bold),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: size,
                color: const Color(0xff085f63),
              )
            : null);
  }
}
