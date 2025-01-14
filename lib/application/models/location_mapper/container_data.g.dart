// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerData _$ContainerDataFromJson(Map<String, dynamic> json) =>
    ContainerData(
      id: json['id'] as String?,
      parentId: json['parentId'] as String?,
      isActive: json['isActive'] as String?,
      num: json['num'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      isRoot: json['isRoot'] as String?,
    );

Map<String, dynamic> _$ContainerDataToJson(ContainerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'isActive': instance.isActive,
      'num': instance.num,
      'code': instance.code,
      'name': instance.name,
      'isRoot': instance.isRoot,
    };
