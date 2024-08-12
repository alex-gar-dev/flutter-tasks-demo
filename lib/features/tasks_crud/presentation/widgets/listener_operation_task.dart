import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/cubit/tasks_cubit.dart';
import 'package:tasks_demo_flutter/ux/ux_design_system.dart';


class ListenerOperationTask extends StatelessWidget {
  const ListenerOperationTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is LoadedTaskState) {
          if (state.statusOperationTask == StatusOperationTask.initLoanding) {
            UXDSLoaderScreen.showPageLoandingScreen(context);
          }
          if (state.statusOperationTask == StatusOperationTask.finishLoanding) {
            UXDSLoaderScreen.hide(context);
            context.pop();
          }
          if (state.statusOperationTask == StatusOperationTask.errorOperation) {
            UXDSLoaderScreen.hide(context);
          }
        }
      },
      child: const SizedBox(height: 20),
    );
  }
}