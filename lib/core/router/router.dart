import 'package:go_router/go_router.dart';
import 'package:godo/core/router/routes.dart';
import 'package:godo/src/presentation/tasks/all_tasks_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const AllTasksScreen();
      },
    ),
  ],
);
