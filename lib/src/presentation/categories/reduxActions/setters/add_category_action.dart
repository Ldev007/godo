import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:godo/core/app_state.dart';
import 'package:godo/src/data/repositories/localRepos/isar_repository.dart';
import 'package:godo/src/domain/entities/task.dart';

// Action to add a task
class AddCategoryAction extends ReduxAction<AppState> {
  final Task task;

  AddCategoryAction(this.task);

  @override
  Future<AppState> reduce() async {
    // Call the repository to persist the task (this could be local or remote)
    await GetIt.I.get<IsarRepository>().addTask(task); // Replace with your actual repo call

    // Add the task to the task list in AppState
    final updatedTaskList = List<Task>.from(state.taskList)..add(task);

    // Return new state with the updated task list
    return state.copyWith(taskList: updatedTaskList);
  }
}
