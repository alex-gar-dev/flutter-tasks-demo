import 'package:flutter/material.dart';
import 'package:tasks_demo_flutter/ux/utils/uxds_colors.dart';

class UXDSTags extends StatelessWidget {

  final String tagName;
  final void Function()? onPressed;

  const UXDSTags({
    required this.tagName,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: UXDSColorApp.backgroudPurple2,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 13
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tagName, 
            style: const TextStyle(color: Colors.white)
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: onPressed,
            child: const Icon(
              Icons.close,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}