import 'package:flutter/material.dart';

class UXDSTextDivider extends StatelessWidget {

  final String label;

  const UXDSTextDivider({
    required this.label,
    super.key  
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 20
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.grey)
          )
        ),
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
