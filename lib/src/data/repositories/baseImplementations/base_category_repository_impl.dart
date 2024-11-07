import 'package:godo/src/data/repositories/baseAbstracts/base_category_repository.dart';
import 'package:godo/src/domain/entities/category.dart';

class CategoryRepositoryImpl implements BaseCategoryRepository {
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
