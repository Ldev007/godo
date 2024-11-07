import 'package:go_router/go_router.dart';
import 'package:godo/core/router/routes.dart';
import 'package:godo/src/domain/entities/task.dart';
import 'package:godo/src/presentation/tasks/all_tasks_screen.dart';
import 'package:godo/src/presentation/tasks/update_task_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const AllTasksScreen();
      },
    ),
    GoRoute(
      path: Routes.updateTaskScreen,
      builder: (context, state) {
        final taskToBeUpdated = state.extra as Task;
        return UpdateTaskScreen(taskToBeUpdated: taskToBeUpdated);
      },
    )
  ],
);
