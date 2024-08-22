import 'package:flutter/material.dart';

class UXDSButtonLink extends StatelessWidget {
  
  final Function()? onPressed;
  final String labelText;

  const UXDSButtonLink({
    required this.onPressed,
    required this.labelText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(2),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Ajuste del área de toque
        alignment: Alignment.centerLeft,         // Alineación del texto
      ),
      child: Text(
        labelText,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue
        ),
      ),
    );
  }
}