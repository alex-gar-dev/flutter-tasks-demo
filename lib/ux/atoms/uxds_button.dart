import 'package:flutter/material.dart';
import 'package:tasks_demo_flutter/ux/utils/uxds_colors.dart';

class UXDSButton extends StatelessWidget {
  
  final Function()? onPressed;
  final String labelText;

  const UXDSButton({
    required this.onPressed,
    required this.labelText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Ajusta el BorderRadius aquí
        ),
        backgroundColor: UXDSColorApp.backgroudPurple
      ),
      onPressed: onPressed,
      child: Text(
        labelText, textAlign: 
        TextAlign.center, 
        style: const TextStyle(color: Colors.white)
      )
    );
  }
}