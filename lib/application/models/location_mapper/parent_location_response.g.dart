// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentLocationResponse _$ParentLocationResponseFromJson(
        Map<String, dynamic> json) =>
    ParentLocationResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      container: (json['getContainer'] as List<dynamic>?)
          ?.map((e) => ContainerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParentLocationResponseToJson(
        ParentLocationResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'getContainer': instance.container,
    };
