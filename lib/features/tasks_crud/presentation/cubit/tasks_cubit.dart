import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task_card.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/domain/repository/task_repository_interface.dart';
part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(super.initialState) {
    getTasks();
  }

  final _taskRepository = GetIt.instance<TaskRepositoryInterface>();
  
  Future<void> getTasks() async {
    emit(InitTaskState());
    List<TaskCard>? tasks = await _taskRepository.getTasks();
    if (tasks == null) {
      emit(ErrorTaskState());
      return;
    }
    emit(LoadedTaskState(tasks: tasks));
  }

  Future<void> addTask({
    required Task task
  }) async {
    final s = state;
    if (s is LoadedTaskState) {
      List<TaskCard> tasks = s.tasks;
      emitInitCudTask(tasks: tasks);
      final Task? t = await _taskRepository.postTasks(task: task);
      if (t == null) {
        emitErrorCudTask(tasks: tasks);
        return;
      }
      tasks.add(TaskCard(
        id: t.id, title: t.title, isCompleted: t.isCompleted,
        date: t.date
      ));
      emitFinishCudTask(tasks: tasks);
    }
  }

  Future<void> updateTask({
    required Task task
  }) async {
    final s = state;
    if (s is LoadedTaskState) {
      List<TaskCard> tasks = s.tasks;
      emitInitCudTask(tasks: tasks);

      final Task? t = await _taskRepository.updateTasks(task: task);
      if (t == null) {
        emitErrorCudTask(tasks: tasks);
        return;
      }

      final int index = tasks.indexWhere((t) => t.id == task.id);
      if (index >= 0) {
        tasks[index] = TaskCard(
          id: t.id, title: t.title, isCompleted: t.isCompleted,
          date: t.date
        );
        emitFinishCudTask(tasks: tasks);
      }
    }
  }

  Future<void> deleteTask({
    required int id
  }) async {
    final s = state;
    if (s is LoadedTaskState) {
      List<TaskCard> tasks = s.tasks;
      emitInitCudTask(tasks: tasks);

      bool response = await _taskRepository.deleteTask(id: id);
      
      if (!response) {
        emitErrorCudTask(tasks: tasks);
        return;
      }

      final int index = tasks.indexWhere((t) => t.id == id);
      if (index >= 0) {
        tasks.removeAt(index);
        emitFinishCudTask(tasks: tasks);
      }
    }
  }
  
  void emitInitCudTask({
    required List<TaskCard> tasks
  }) {
    emit(
      LoadedTaskState(
        statusOperationTask: StatusOperationTask.initLoanding,
        tasks: tasks
      )
    );
  }

  void emitErrorCudTask({
    required List<TaskCard> tasks
  }) {
    emit(
      LoadedTaskState(
        statusOperationTask: StatusOperationTask.errorOperation,
        tasks: tasks
      )
    );
  }

  void emitFinishCudTask({
    required List<TaskCard> tasks
  }) {
    emit(
      LoadedTaskState(
        statusOperationTask: StatusOperationTask.finishLoanding,
        tasks: tasks
      )
    );
  }

}