import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_demo_flutter/core/core.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/cubit/tasks_cubit.dart';
import 'package:tasks_demo_flutter/ux/ux_design_system.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => TasksCubit(InitTaskState())
        )
      ],
      child: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: UXDSAppTheme.uxdsAppTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: router
          );
        },
      )
    );
  }
}