import 'package:flutter/material.dart';

class UXDSButtonProviders extends StatelessWidget {

  final Function()? onPressed;
  final String? image;
  final Color? backgroundColor;
  final Widget? child;

  const UXDSButtonProviders({
    required this.onPressed,
    super.key,
    this.image,
    this.backgroundColor,
    this.child = const Text('label')
  });

  const UXDSButtonProviders.google({
    required this.onPressed,
    super.key,
    this.image = 'assets/icon/google.png',
    this.backgroundColor = Colors.white,
    this.child = const Text('Sign in with google', style: TextStyle(color: Colors.black),)
  });

  const UXDSButtonProviders.apple({
    required this.onPressed,
    super.key,
    this.image = 'assets/icon/apple.png',
    this.backgroundColor = Colors.black,
    this.child = const Text('Sign in with apple', style: TextStyle(color: Colors.white))
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, 
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Ajusta el BorderRadius aquí
        ),
      ),
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image ?? '',
            width: 40,
            height: 40
          ),
          const SizedBox(width: 10),
          Flexible(child: child ?? const Text('Sign in'))
        ],
      ),
    );
  }
}