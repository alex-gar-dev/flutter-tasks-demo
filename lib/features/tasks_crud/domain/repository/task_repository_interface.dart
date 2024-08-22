import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task_card.dart';

abstract class TaskRepositoryInterface {
  Future<List<TaskCard>?> getTasks();
  Future<Task?> getTask({
    required String id
  });
  Future<Task?> postTasks({
    required Task task
  });
  Future<Task?> updateTasks({
    required Task task
  });
  Future<bool> deleteTask({
    required String id
  });
}