import 'package:flutter/material.dart';

class UXDSFooter extends StatelessWidget {
  final String title;
  final String time;

  const UXDSFooter({
    required this.time, 
    required this.title, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(title),
          Text(time),
        ],
      ),
    );
  }
}
