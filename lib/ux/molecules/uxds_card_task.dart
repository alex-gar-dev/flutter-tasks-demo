import 'package:flutter/material.dart';
import 'package:tasks_demo_flutter/ux/utils/utils.dart';

class UXDSCardTask extends StatelessWidget {

  final String title;
  final bool isCompleted;
  final String? date;
  final String? description;
  final void Function()? onTap;

  const UXDSCardTask({
    required this.title,
    required this.isCompleted,
    super.key,
    this.date,
    this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 9,
      shadowColor: Colors.grey.shade100,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Icon(
          isCompleted ? Icons.check_circle_outline : Icons.pending_actions,
          color: isCompleted ? UXDSColorApp.backgroudPurple : Colors.grey,
          size: 30,
        ),
        title: Text(title),
        isThreeLine: false,
        trailing: const Icon(
          Icons.arrow_forward_ios, 
          color: UXDSColorApp.backgroudPurple
        ),
        subtitle: description != null ? Text(description ?? '') : null,
        onTap: onTap
      ),
    );
  }
}
