import 'package:flutter/material.dart';
import 'package:tasks_demo_flutter/ux/utils/uxds_colors.dart';

class UxdsFormInputSwitch extends StatefulWidget {
  final String label;
  final Function(bool value) onChanged;
  final bool isCompleted;
  const UxdsFormInputSwitch({
    required this.label,
    required this.onChanged,
    super.key,
    this.isCompleted = false
  });
  @override
  State<UxdsFormInputSwitch> createState() => _UxdsFormInputSwitchState();
}

class _UxdsFormInputSwitchState extends State<UxdsFormInputSwitch> {

  late bool isCompleted;

  @override
  void initState() {
    isCompleted = widget.isCompleted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label),
        const SizedBox(width: 20),
        Switch(
          value: isCompleted,
          activeColor: UXDSColorApp.backgroudPurple,
          onChanged: (bool value) {
            isCompleted = value;
            setState(() {
            });
            widget.onChanged(value);
          }
        )
      ],
    );
  }
}