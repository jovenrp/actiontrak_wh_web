// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileStateImpl _$$ProfileStateImplFromJson(Map<String, dynamic> json) =>
    _$ProfileStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      isUpdated: json['isUpdated'] as bool? ?? false,
      pickLimitSetting: json['pickLimitSetting'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProfileStateImplToJson(_$ProfileStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isUpdated': instance.isUpdated,
      'pickLimitSetting': instance.pickLimitSetting,
    };
