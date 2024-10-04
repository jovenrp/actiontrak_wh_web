// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileState _$ProfileStateFromJson(Map<String, dynamic> json) {
  return _ProfileState.fromJson(json);
}

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdated => throw _privateConstructorUsedError;
  bool get pickLimitSetting => throw _privateConstructorUsedError;

  /// Serializes this ProfileState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call({bool isLoading, bool isUpdated, bool pickLimitSetting});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdated = null,
    Object? pickLimitSetting = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdated: null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      pickLimitSetting: null == pickLimitSetting
          ? _value.pickLimitSetting
          : pickLimitSetting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isUpdated, bool pickLimitSetting});
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdated = null,
    Object? pickLimitSetting = null,
  }) {
    return _then(_$ProfileStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdated: null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      pickLimitSetting: null == pickLimitSetting
          ? _value.pickLimitSetting
          : pickLimitSetting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileStateImpl implements _ProfileState {
  _$ProfileStateImpl(
      {this.isLoading = false,
      this.isUpdated = false,
      this.pickLimitSetting = false});

  factory _$ProfileStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdated;
  @override
  @JsonKey()
  final bool pickLimitSetting;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, isUpdated: $isUpdated, pickLimitSetting: $pickLimitSetting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdated, isUpdated) ||
                other.isUpdated == isUpdated) &&
            (identical(other.pickLimitSetting, pickLimitSetting) ||
                other.pickLimitSetting == pickLimitSetting));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isUpdated, pickLimitSetting);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileStateImplToJson(
      this,
    );
  }
}

abstract class _ProfileState implements ProfileState {
  factory _ProfileState(
      {final bool isLoading,
      final bool isUpdated,
      final bool pickLimitSetting}) = _$ProfileStateImpl;

  factory _ProfileState.fromJson(Map<String, dynamic> json) =
      _$ProfileStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get isUpdated;
  @override
  bool get pickLimitSetting;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
