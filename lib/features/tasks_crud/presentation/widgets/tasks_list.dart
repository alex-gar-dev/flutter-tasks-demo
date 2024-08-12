import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task_card.dart';
import 'package:tasks_demo_flutter/ux/ux_design_system.dart';

class TasksList extends StatelessWidget {

  final List<TaskCard> tasks;
  
  const TasksList({
    required this.tasks,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final TaskCard tc = tasks[index];
        final int id = tc.id;
        return UXDSCardTask(
          title: tc.title,
          isCompleted: tc.isCompleted,
          description: tc.date,
          date: tc.date,
          onTap: () => context.push('/detail/$id'),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20)
    );
  }
}
