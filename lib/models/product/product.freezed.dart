// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @HiveField(1)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get image_url => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get cost => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get sizes => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get categoryId => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@HiveField(1) int? id,
      @HiveField(2) String? name,
      @HiveField(3) String? image_url,
      @HiveField(4) int? cost,
      @HiveField(5) String? sizes,
      @HiveField(6) int? categoryId,
      @HiveField(7) String? description});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image_url = freezed,
    Object? cost = freezed,
    Object? sizes = freezed,
    Object? categoryId = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      sizes: freezed == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) int? id,
      @HiveField(2) String? name,
      @HiveField(3) String? image_url,
      @HiveField(4) int? cost,
      @HiveField(5) String? sizes,
      @HiveField(6) int? categoryId,
      @HiveField(7) String? description});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image_url = freezed,
    Object? cost = freezed,
    Object? sizes = freezed,
    Object? categoryId = freezed,
    Object? description = freezed,
  }) {
    return _then(_$ProductImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product with DiagnosticableTreeMixin {
  _$ProductImpl(
      @HiveField(1) this.id,
      @HiveField(2) this.name,
      @HiveField(3) this.image_url,
      @HiveField(4) this.cost,
      @HiveField(5) this.sizes,
      @HiveField(6) this.categoryId,
      @HiveField(7) this.description)
      : super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @HiveField(1)
  final int? id;
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final String? image_url;
  @override
  @HiveField(4)
  final int? cost;
  @override
  @HiveField(5)
  final String? sizes;
  @override
  @HiveField(6)
  final int? categoryId;
  @override
  @HiveField(7)
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Product(id: $id, name: $name, image_url: $image_url, cost: $cost, sizes: $sizes, categoryId: $categoryId, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Product'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('image_url', image_url))
      ..add(DiagnosticsProperty('cost', cost))
      ..add(DiagnosticsProperty('sizes', sizes))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.sizes, sizes) || other.sizes == sizes) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, image_url, cost, sizes, categoryId, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  factory _Product(
      @HiveField(1) final int? id,
      @HiveField(2) final String? name,
      @HiveField(3) final String? image_url,
      @HiveField(4) final int? cost,
      @HiveField(5) final String? sizes,
      @HiveField(6) final int? categoryId,
      @HiveField(7) final String? description) = _$ProductImpl;
  _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @HiveField(1)
  int? get id;
  @override
  @HiveField(2)
  String? get name;
  @override
  @HiveField(3)
  String? get image_url;
  @override
  @HiveField(4)
  int? get cost;
  @override
  @HiveField(5)
  String? get sizes;
  @override
  @HiveField(6)
  int? get categoryId;
  @override
  @HiveField(7)
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
