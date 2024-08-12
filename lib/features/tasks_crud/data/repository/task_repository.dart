import 'package:dio/dio.dart';
import 'package:tasks_demo_flutter/core/core.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task_card.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/domain/repository/task_repository_interface.dart';

class TaskRepository extends TaskRepositoryInterface {

  final _host = getIt<HostApi>();

  @override
  Future<List<TaskCard>?> getTasks() async {
    try {
      final Response response = await _host.service.get('tasks');
      if ([200, 201].contains(response.statusCode)) {
        final data = List.from(response.data);
        return data.map((d) => TaskCard.fromMap(d)).toList();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  
  @override
  Future<Task?> getTask({
    required int id
  }) async {
    try {
      final Response response = await _host.service.get('tasks/$id');
      if ([200, 201].contains(response.statusCode)) {
        List body = response.data;
        return body.isNotEmpty ? Task.fromMap(body[0]) : null;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Task?> postTasks({
    required Task task
  }) async {
    try {
      final Response response = await _host.service.post('tasks', 
        data: task.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        )
      );
      if (response.statusCode == 201) {
        final newTask = task;
        final Map map = response.data['task'] ?? {};
        return newTask.copyWith(id:  map['id'] ?? 0);
      }
      return null;
    } catch (_) {
      return null;
    }
  }
  
  @override
  Future<Task?> updateTasks({
    required Task task
  }) async {
    try {
      print(task.toJson());
      final Response response = await _host.service.put('tasks/${task.id}', data: task.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        )
      );
      if (response.statusCode == 201) {
        final newTask = task;
        final Map map = response.data['task'] ?? {};
        return newTask.copyWith(id:  map['id'] ?? 0);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> deleteTask({
    required int id
  }) async {
    try {
      final Response response = await _host.service.delete(
        'tasks/$id'
      );
      return [200, 201].contains(response.statusCode);
    } catch (_) {
      return false;
    }
  }

}