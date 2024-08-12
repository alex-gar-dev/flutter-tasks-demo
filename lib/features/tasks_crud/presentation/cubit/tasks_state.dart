part of 'tasks_cubit.dart';

enum StatusOperationTask {
  initLoanding,
  finishLoanding,
  errorOperation
}

abstract class TasksState {}

class InitTaskState implements TasksState {}

class LoandingInitTaskState implements TasksState {}

class LoadedTaskState implements TasksState {
  StatusOperationTask? statusOperationTask;
  final List<TaskCard> tasks;

  LoadedTaskState({
    required this.tasks,
    this.statusOperationTask
  });
}

class ErrorTaskState implements TasksState {}