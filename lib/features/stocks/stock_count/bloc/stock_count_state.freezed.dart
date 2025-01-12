// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_count_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockCountState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get statusCode => throw _privateConstructorUsedError;
  List<StockCountData>? get stockCount => throw _privateConstructorUsedError;
  bool get didFinish => throw _privateConstructorUsedError;

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockCountStateCopyWith<StockCountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCountStateCopyWith<$Res> {
  factory $StockCountStateCopyWith(
          StockCountState value, $Res Function(StockCountState) then) =
      _$StockCountStateCopyWithImpl<$Res, StockCountState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String? errorMessage,
      String? statusCode,
      List<StockCountData>? stockCount,
      bool didFinish});
}

/// @nodoc
class _$StockCountStateCopyWithImpl<$Res, $Val extends StockCountState>
    implements $StockCountStateCopyWith<$Res> {
  _$StockCountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = freezed,
    Object? statusCode = freezed,
    Object? stockCount = freezed,
    Object? didFinish = null,
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
      stockCount: freezed == stockCount
          ? _value.stockCount
          : stockCount // ignore: cast_nullable_to_non_nullable
              as List<StockCountData>?,
      didFinish: null == didFinish
          ? _value.didFinish
          : didFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockCountStateImplCopyWith<$Res>
    implements $StockCountStateCopyWith<$Res> {
  factory _$$StockCountStateImplCopyWith(_$StockCountStateImpl value,
          $Res Function(_$StockCountStateImpl) then) =
      __$$StockCountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String? errorMessage,
      String? statusCode,
      List<StockCountData>? stockCount,
      bool didFinish});
}

/// @nodoc
class __$$StockCountStateImplCopyWithImpl<$Res>
    extends _$StockCountStateCopyWithImpl<$Res, _$StockCountStateImpl>
    implements _$$StockCountStateImplCopyWith<$Res> {
  __$$StockCountStateImplCopyWithImpl(
      _$StockCountStateImpl _value, $Res Function(_$StockCountStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = freezed,
    Object? statusCode = freezed,
    Object? stockCount = freezed,
    Object? didFinish = null,
  }) {
    return _then(_$StockCountStateImpl(
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
      stockCount: freezed == stockCount
          ? _value._stockCount
          : stockCount // ignore: cast_nullable_to_non_nullable
              as List<StockCountData>?,
      didFinish: null == didFinish
          ? _value.didFinish
          : didFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StockCountStateImpl implements _StockCountState {
  _$StockCountStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      this.errorMessage = '',
      this.statusCode = '',
      final List<StockCountData>? stockCount,
      this.didFinish = false})
      : _stockCount = stockCount;

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
  final List<StockCountData>? _stockCount;
  @override
  List<StockCountData>? get stockCount {
    final value = _stockCount;
    if (value == null) return null;
    if (_stockCount is EqualUnmodifiableListView) return _stockCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool didFinish;

  @override
  String toString() {
    return 'StockCountState(isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, statusCode: $statusCode, stockCount: $stockCount, didFinish: $didFinish)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockCountStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality()
                .equals(other._stockCount, _stockCount) &&
            (identical(other.didFinish, didFinish) ||
                other.didFinish == didFinish));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      errorMessage,
      statusCode,
      const DeepCollectionEquality().hash(_stockCount),
      didFinish);

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockCountStateImplCopyWith<_$StockCountStateImpl> get copyWith =>
      __$$StockCountStateImplCopyWithImpl<_$StockCountStateImpl>(
          this, _$identity);
}

abstract class _StockCountState implements StockCountState {
  factory _StockCountState(
      {final bool isLoading,
      final bool hasError,
      final String? errorMessage,
      final String? statusCode,
      final List<StockCountData>? stockCount,
      final bool didFinish}) = _$StockCountStateImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String? get errorMessage;
  @override
  String? get statusCode;
  @override
  List<StockCountData>? get stockCount;
  @override
  bool get didFinish;

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockCountStateImplCopyWith<_$StockCountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
