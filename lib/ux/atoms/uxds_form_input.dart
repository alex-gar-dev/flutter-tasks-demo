import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UXDSFormField extends StatelessWidget {

  final TextEditingController? controller;
  final String? helperText;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;

  const UXDSFormField({
    super.key,
    this.controller,
    this.helperText,
    this.labelText,
    this.validator,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.focusNode,
    this.keyboardType = TextInputType.none,
    this.maxLines =  1,
    this.inputFormatters,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.enabled
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      decoration: InputDecoration(
        helperText: helperText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      enabled: enabled,
      enableSuggestions: enableSuggestions,
      obscureText: obscureText,
      autocorrect: autocorrect,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}