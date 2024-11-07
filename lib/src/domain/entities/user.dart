import 'package:godo/src/domain/entities/category.dart';
import 'package:godo/src/domain/entities/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String email;
  final List<Task> taskIds;
  final List<Category> categories;

  User({required this.id, required this.name, required this.email, required this.taskIds, required this.categories});
}
