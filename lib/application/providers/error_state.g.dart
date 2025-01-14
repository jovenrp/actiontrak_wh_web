// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorStateImpl _$$ErrorStateImplFromJson(Map<String, dynamic> json) =>
    _$ErrorStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      hasError: json['hasError'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String? ?? '',
      errorStatus: json['errorStatus'] as String? ?? '',
    );

Map<String, dynamic> _$$ErrorStateImplToJson(_$ErrorStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'hasError': instance.hasError,
      'errorMessage': instance.errorMessage,
      'errorStatus': instance.errorStatus,
    };
