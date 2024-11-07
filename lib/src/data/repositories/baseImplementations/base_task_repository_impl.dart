import 'package:get_it/get_it.dart';
import 'package:godo/src/data/repositories/baseAbstracts/base_task_repository.dart';
import 'package:godo/src/data/repositories/localRepos/isar_repository.dart';
import 'package:godo/src/data/repositories/remoteRepos/mongodb_repository.dart';
import 'package:godo/src/domain/entities/task.dart';

class BaseTaskRepositoryImpl implements BaseTaskRepository {
  @override
  Future<void> addTask(Task task) async {
    await GetIt.I.get<IsarRepository>().addTask(task);
    // TODO: Put check for performing remote operations only when internet is available or else add to the queue
    await GetIt.I.get<MongoDBRepository>().addTask(task);
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask({required String taskId}) async {
    await GetIt.I.get<IsarRepository>().deleteTask(taskId: taskId);
    // TODO: Put check for performing remote operations only when internet is available or else add to the queue
    await GetIt.I.get<MongoDBRepository>().deleteTask(taskId: taskId);
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final latestTasks = [];
    final localTasks = await GetIt.I.get<IsarRepository>().getAllTasks();
    // TODO: Put check for performing remote operations only when internet is available or else add to the queue
    final remoteTasks = await GetIt.I.get<MongoDBRepository>().getAllTasks();

    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) async {
    await GetIt.I.get<IsarRepository>().updateTask(task);
    // TODO: Put check for performing remote operations only when internet is available or else add to the queue
    await GetIt.I.get<MongoDBRepository>().updateTask(task);
    throw UnimplementedError();
  }
}
