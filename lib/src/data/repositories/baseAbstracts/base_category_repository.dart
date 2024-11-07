import 'package:godo/src/domain/entities/category.dart';

abstract class BaseCategoryRepository {
  Future<void> addCategory(Category category);
  Future<void> updateCategory(Category category);
  Future<void> deleteCategory({required String categoryId});
  Future<List<Category>> getAllCategories();
}
