import 'package:godo/src/domain/entities/task.dart';

abstract class BaseTaskRepository {
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask({required String taskId});
  Future<List<Task>> getAllTasks();
}
