// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginStateImpl _$$LoginStateImplFromJson(Map<String, dynamic> json) =>
    _$LoginStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      loginStatus: json['loginStatus'] as bool? ?? false,
      loginMessage: json['loginMessage'] as String? ?? '',
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginStateImplToJson(_$LoginStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'loginStatus': instance.loginStatus,
      'loginMessage': instance.loginMessage,
      'user': instance.user,
    };
