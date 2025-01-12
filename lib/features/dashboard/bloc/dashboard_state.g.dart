// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStateImpl _$$DashboardStateImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStateImpl(
      hasError: json['hasError'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String? ?? '',
      statusCode: json['statusCode'] as String? ?? '',
    );

Map<String, dynamic> _$$DashboardStateImplToJson(
        _$DashboardStateImpl instance) =>
    <String, dynamic>{
      'hasError': instance.hasError,
      'errorMessage': instance.errorMessage,
      'statusCode': instance.statusCode,
    };
