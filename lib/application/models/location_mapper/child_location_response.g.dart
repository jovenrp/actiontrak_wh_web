// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildLocationResponse _$ChildLocationResponseFromJson(
        Map<String, dynamic> json) =>
    ChildLocationResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      container: (json['container'] as List<dynamic>?)
          ?.map((e) => ContainerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChildLocationResponseToJson(
        ChildLocationResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'container': instance.container,
    };
