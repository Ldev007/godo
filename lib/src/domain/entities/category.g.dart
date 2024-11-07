// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String,
      dbId: json['dbId'] as String,
      taskIds:
          (json['taskIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'dbId': instance.dbId,
      'taskIds': instance.taskIds,
    };
