// app_state.dart
import 'package:godo/src/domain/entities/task.dart';

class AppState {
  final List<Task> taskList;

  AppState({required this.taskList});

  // The copy constructor is needed for the state management, so Redux can perform updates
  AppState copyWith({List<Task>? taskList}) {
    return AppState(
      taskList: taskList ?? this.taskList,
    );
  }

  // Initial app state
  static AppState initialState() {
    return AppState(taskList: []);
  }
}
