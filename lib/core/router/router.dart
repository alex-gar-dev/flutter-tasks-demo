import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/screens/screens.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TasksScreen(),
    ),
    GoRoute(
      path: '/new-task',
      builder: (context, state) => const NewTaskScreen(),
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) => DetailTaskScreen(
        id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0
      ),
    ),
  ],
);