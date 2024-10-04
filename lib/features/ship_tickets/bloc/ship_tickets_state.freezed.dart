// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ship_tickets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShipTicketsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<ShipTicketsData>? get shipTickets => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ShipTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipTicketsStateCopyWith<ShipTicketsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipTicketsStateCopyWith<$Res> {
  factory $ShipTicketsStateCopyWith(
          ShipTicketsState value, $Res Function(ShipTicketsState) then) =
      _$ShipTicketsStateCopyWithImpl<$Res, ShipTicketsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<ShipTicketsData>? shipTickets,
      String? errorMessage});
}

/// @nodoc
class _$ShipTicketsStateCopyWithImpl<$Res, $Val extends ShipTicketsState>
    implements $ShipTicketsStateCopyWith<$Res> {
  _$ShipTicketsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? shipTickets = freezed,
    Object? errorMessage = freezed,
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
      shipTickets: freezed == shipTickets
          ? _value.shipTickets
          : shipTickets // ignore: cast_nullable_to_non_nullable
              as List<ShipTicketsData>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShipTicketsStateImplCopyWith<$Res>
    implements $ShipTicketsStateCopyWith<$Res> {
  factory _$$ShipTicketsStateImplCopyWith(_$ShipTicketsStateImpl value,
          $Res Function(_$ShipTicketsStateImpl) then) =
      __$$ShipTicketsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<ShipTicketsData>? shipTickets,
      String? errorMessage});
}

/// @nodoc
class __$$ShipTicketsStateImplCopyWithImpl<$Res>
    extends _$ShipTicketsStateCopyWithImpl<$Res, _$ShipTicketsStateImpl>
    implements _$$ShipTicketsStateImplCopyWith<$Res> {
  __$$ShipTicketsStateImplCopyWithImpl(_$ShipTicketsStateImpl _value,
      $Res Function(_$ShipTicketsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShipTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? shipTickets = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ShipTicketsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      shipTickets: freezed == shipTickets
          ? _value._shipTickets
          : shipTickets // ignore: cast_nullable_to_non_nullable
              as List<ShipTicketsData>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ShipTicketsStateImpl implements _ShipTicketsState {
  _$ShipTicketsStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      final List<ShipTicketsData>? shipTickets,
      this.errorMessage})
      : _shipTickets = shipTickets;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  final List<ShipTicketsData>? _shipTickets;
  @override
  List<ShipTicketsData>? get shipTickets {
    final value = _shipTickets;
    if (value == null) return null;
    if (_shipTickets is EqualUnmodifiableListView) return _shipTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ShipTicketsState(isLoading: $isLoading, hasError: $hasError, shipTickets: $shipTickets, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipTicketsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            const DeepCollectionEquality()
                .equals(other._shipTickets, _shipTickets) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError,
      const DeepCollectionEquality().hash(_shipTickets), errorMessage);

  /// Create a copy of ShipTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipTicketsStateImplCopyWith<_$ShipTicketsStateImpl> get copyWith =>
      __$$ShipTicketsStateImplCopyWithImpl<_$ShipTicketsStateImpl>(
          this, _$identity);
}

abstract class _ShipTicketsState implements ShipTicketsState {
  factory _ShipTicketsState(
      {final bool isLoading,
      final bool hasError,
      final List<ShipTicketsData>? shipTickets,
      final String? errorMessage}) = _$ShipTicketsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  List<ShipTicketsData>? get shipTickets;
  @override
  String? get errorMessage;

  /// Create a copy of ShipTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipTicketsStateImplCopyWith<_$ShipTicketsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
