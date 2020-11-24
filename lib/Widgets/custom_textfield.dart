import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    this.enabled,
    this.maxLines,
    this.minLines,
    this.textCapitalization,
    this.errorText, this.prefix,
  });

  final TextEditingController controller;
  final String labelText;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final Widget prefix;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final int minLines;
  final TextCapitalization textCapitalization;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: labelText,
        errorText: errorText ?? null,
      ),
      cursorWidth: 1,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      enabled: enabled,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
    );
  }
}
