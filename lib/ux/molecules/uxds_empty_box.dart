import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UXDSEmptyBox extends StatelessWidget {
  
  final String label;

  const UXDSEmptyBox({
    required this.label,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/lottie/empty_box.json'),
        const SizedBox(height: 20),
        Text(label)
      ],
    );
  }
}