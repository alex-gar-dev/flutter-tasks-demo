import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/features/auth/index.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/screens/screens.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
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
        id: state.pathParameters['id'] ?? '0'
      ),
    ),
  ],
);