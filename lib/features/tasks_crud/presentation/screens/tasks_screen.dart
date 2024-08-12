import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/cubit/tasks_cubit.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/widgets/tasks_list.dart';
import 'package:tasks_demo_flutter/ux/utils/utils.dart';
import 'package:tasks_demo_flutter/ux/ux_design_system.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: UXDSColorApp.backgroudPurple,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.refresh),
          onPressed: () {
            context.read<TasksCubit>().getTasks();
          },
          iconSize: 30,
        ),
        title: const Text('My tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10
        ),
        child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            if (state is LoadedTaskState) {
              if (state.tasks.isEmpty) {
                return const SafeArea(
                  child: Center(
                    child: UXDSEmptyBox(
                      label: 'Tasks not Found',
                    ),
                  ),
                );
              }
              return TasksList(
                tasks: state.tasks
              );
            }
            if (state is ErrorTaskState) {
              return const Text('Error al obtener tareas');
            }
            return const Center(
              child: CircularProgressIndicator()
            );
          },
        ),
      ),
      floatingActionButton: IconButton(
        color: Colors.white,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(
            UXDSColorApp.backgroudPurple
          ),
        ),
        icon: const Icon(
          Icons.add
        ),
        onPressed: () {
          context.push('/new-task');
        },
      ),
    );
  }
}
