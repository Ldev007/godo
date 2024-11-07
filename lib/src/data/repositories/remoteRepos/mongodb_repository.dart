import 'package:godo/src/data/repositories/baseAbstracts/base_category_repository.dart';
import 'package:godo/src/data/repositories/baseAbstracts/base_task_repository.dart';
import 'package:godo/src/domain/entities/category.dart';
import 'package:godo/src/domain/entities/task.dart';

class MongoDBRepository implements BaseTaskRepository, BaseCategoryRepository {
  @override
  Future<void> addTask(Task task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask({required String taskId}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<void> addCategory(Category category) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory({required String categoryId}) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<void> updateCategory(Category category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
