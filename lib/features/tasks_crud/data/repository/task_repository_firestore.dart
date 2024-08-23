import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_demo_flutter/features/auth/index.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task_card.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/domain/repository/task_repository_interface.dart';

class TaskRepositoryFirestore extends TaskRepositoryInterface  {

  CollectionReference tasksCollection = FirebaseFirestore.instance.collection('tasks');
  final authRepository = GetIt.instance<AuthenticatonInterface>();

  @override
  Future<List<TaskCard>?> getTasks() async {
    try {
      String userId = authRepository.getUserId();
      final QuerySnapshot tasks = await tasksCollection.where(
        'user_id', isEqualTo: userId
      ).get();
      return tasks.docs.map(
        (doc) => TaskCard(
          id: doc.id, 
          title: doc['title'], 
          isCompleted: doc['is_completed']
        )
      ).toList();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Task?> getTask({required String id}) async {
    try {
      final DocumentSnapshot<Object?> task = await tasksCollection.doc(id).get();
      if (task.exists) {
        final data = task.data() as Map<String, dynamic>;
        return Task.fromMap(data);
      }
      return null;
    } catch (_) {
      return null;
    }
  }
  

  @override
  Future<Task?> postTasks({required Task task}) async {
    try {
      String userId = authRepository.getUserId();
      final response = await tasksCollection.add({
        ...task.toJson(),
        'user_id': userId
      });
      final newTask = task;
      return newTask.copyWith(id: response.id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Task?> updateTasks({required Task task}) async {
    try {
      await tasksCollection.doc(task.id).update(task.toJson());
      return task;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> deleteTask({required String id}) async {
    try {
      await tasksCollection.doc(id).delete();
      return true;
    } catch (_) {
      return false;
    }
  }

  
}