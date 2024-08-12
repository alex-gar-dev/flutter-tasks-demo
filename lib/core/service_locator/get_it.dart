import 'package:get_it/get_it.dart';
import 'package:tasks_demo_flutter/core/api/host_api.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/repository/task_repository.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/domain/repository/task_repository_interface.dart';

final getIt = GetIt.instance;

class ServiceLocatorGetIt {
  
  static void setupLocator() {
    getIt.registerSingleton<HostApi>(HostApi());
    getIt.registerFactory<TaskRepositoryInterface>(() => TaskRepository());
  }
}