// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_tickets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PickTicketsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get statusCode => throw _privateConstructorUsedError;
  List<PickTicketsData>? get pickTickets => throw _privateConstructorUsedError;

  /// Create a copy of PickTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickTicketsStateCopyWith<PickTicketsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickTicketsStateCopyWith<$Res> {
  factory $PickTicketsStateCopyWith(
          PickTicketsState value, $Res Function(PickTicketsState) then) =
      _$PickTicketsStateCopyWithImpl<$Res, PickTicketsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String? errorMessage,
      String? statusCode,
      List<PickTicketsData>? pickTickets});
}

/// @nodoc
class _$PickTicketsStateCopyWithImpl<$Res, $Val extends PickTicketsState>
    implements $PickTicketsStateCopyWith<$Res> {
  _$PickTicketsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = freezed,
    Object? statusCode = freezed,
    Object? pickTickets = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pickTickets: freezed == pickTickets
          ? _value.pickTickets
          : pickTickets // ignore: cast_nullable_to_non_nullable
              as List<PickTicketsData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PickTicketsStateImplCopyWith<$Res>
    implements $PickTicketsStateCopyWith<$Res> {
  factory _$$PickTicketsStateImplCopyWith(_$PickTicketsStateImpl value,
          $Res Function(_$PickTicketsStateImpl) then) =
      __$$PickTicketsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String? errorMessage,
      String? statusCode,
      List<PickTicketsData>? pickTickets});
}

/// @nodoc
class __$$PickTicketsStateImplCopyWithImpl<$Res>
    extends _$PickTicketsStateCopyWithImpl<$Res, _$PickTicketsStateImpl>
    implements _$$PickTicketsStateImplCopyWith<$Res> {
  __$$PickTicketsStateImplCopyWithImpl(_$PickTicketsStateImpl _value,
      $Res Function(_$PickTicketsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PickTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = freezed,
    Object? statusCode = freezed,
    Object? pickTickets = freezed,
  }) {
    return _then(_$PickTicketsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pickTickets: freezed == pickTickets
          ? _value._pickTickets
          : pickTickets // ignore: cast_nullable_to_non_nullable
              as List<PickTicketsData>?,
    ));
  }
}

/// @nodoc

class _$PickTicketsStateImpl implements _PickTicketsState {
  _$PickTicketsStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      this.errorMessage = '',
      this.statusCode = '',
      final List<PickTicketsData>? pickTickets})
      : _pickTickets = pickTickets;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final String? statusCode;
  final List<PickTicketsData>? _pickTickets;
  @override
  List<PickTicketsData>? get pickTickets {
    final value = _pickTickets;
    if (value == null) return null;
    if (_pickTickets is EqualUnmodifiableListView) return _pickTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PickTicketsState(isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, statusCode: $statusCode, pickTickets: $pickTickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickTicketsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality()
                .equals(other._pickTickets, _pickTickets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      errorMessage,
      statusCode,
      const DeepCollectionEquality().hash(_pickTickets));

  /// Create a copy of PickTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickTicketsStateImplCopyWith<_$PickTicketsStateImpl> get copyWith =>
      __$$PickTicketsStateImplCopyWithImpl<_$PickTicketsStateImpl>(
          this, _$identity);
}

abstract class _PickTicketsState implements PickTicketsState {
  factory _PickTicketsState(
      {final bool isLoading,
      final bool hasError,
      final String? errorMessage,
      final String? statusCode,
      final List<PickTicketsData>? pickTickets}) = _$PickTicketsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String? get errorMessage;
  @override
  String? get statusCode;
  @override
  List<PickTicketsData>? get pickTickets;

  /// Create a copy of PickTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickTicketsStateImplCopyWith<_$PickTicketsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
