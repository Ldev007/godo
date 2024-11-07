import 'package:godo/src/data/repositories/baseAbstracts/base_category_repository.dart';
import 'package:godo/src/data/repositories/baseAbstracts/base_task_repository.dart';
import 'package:godo/src/domain/entities/category.dart';
import 'package:godo/src/domain/entities/task.dart';

class IsarRepository implements BaseTaskRepository, BaseCategoryRepository {
  @override
  Future<void> addTask(Task task) async {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask({required String taskId}) async {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTasks() async {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) async {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<void> addCategory(Category category) async {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory({required String categoryId}) async {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAllCategories() async {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<void> updateCategory(Category category) async {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
