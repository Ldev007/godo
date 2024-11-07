import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:godo/core/app_state.dart';
import 'package:godo/src/data/repositories/baseAbstracts/base_task_repository.dart';
import 'package:godo/src/domain/entities/task.dart';

// Action to add a task
class AddTaskAction extends ReduxAction<AppState> {
  final Task task;

  AddTaskAction(this.task);

  @override
  Future<AppState> reduce() async {
    await GetIt.I.get<BaseTaskRepository>().addTask(task);

    final updatedTaskList = List<Task>.from(state.taskList)..add(task);

    return state.copyWith(taskList: updatedTaskList);
  }
}
