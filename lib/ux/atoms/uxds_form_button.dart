import 'package:flutter/material.dart';
import 'package:tasks_demo_flutter/ux/utils/utils.dart';

class UXDSFormButton extends StatelessWidget {

  final String label;
  final void Function()? onPressed;

  const UXDSFormButton({
    required this.label,
    super.key,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(
              UXDSColorApp.backgroudPurple
            )
          ),
          onPressed: onPressed,    
          child: Text(label, style: UXDSTextStylesApp.primaryText)
        ),
      ),
    );
  }
}