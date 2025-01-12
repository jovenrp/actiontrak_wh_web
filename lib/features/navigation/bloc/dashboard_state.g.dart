// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NavigationStateImpl _$$NavigationStateImplFromJson(
        Map<String, dynamic> json) =>
    _$NavigationStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      user: json['user'] as String? ?? '',
    );

Map<String, dynamic> _$$NavigationStateImplToJson(
        _$NavigationStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'user': instance.user,
    };
