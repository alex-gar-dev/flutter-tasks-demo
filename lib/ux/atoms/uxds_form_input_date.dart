import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'uxds_form_input.dart';

class UXDSFormInputDate extends StatelessWidget {

  final TextEditingController? controller;
  final String? helperText;
  final String? labelText;
  final String? Function(String?)? validator;
  
  const UXDSFormInputDate({
    super.key,
    this.controller,
    this.helperText,
    this.labelText,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return UXDSFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DateTextInputFormatter(),
        LengthLimitingTextInputFormatter(10)
      ],
      labelText: labelText,
      helperText: helperText,
      validator: validator
    );
  }
}

class DateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Eliminar cualquier carácter que no sea un dígito
    final text = newValue.text;
    final newText = StringBuffer();

    // Añadir las barras en las posiciones adecuadas
    for (int i = 0; i < text.length; i++) {
      if (i == 2 || i == 4) {
        newText.write('/');
      }
      newText.write(text[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}