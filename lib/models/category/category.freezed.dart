// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductsCategory _$ProductsCategoryFromJson(Map<String, dynamic> json) {
  return _ProductsCategory.fromJson(json);
}

/// @nodoc
mixin _$ProductsCategory {
  int? get id => throw _privateConstructorUsedError;
  String? get image_url => throw _privateConstructorUsedError;
  String? get category_name => throw _privateConstructorUsedError;
  List<Product>? get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsCategoryCopyWith<ProductsCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsCategoryCopyWith<$Res> {
  factory $ProductsCategoryCopyWith(
          ProductsCategory value, $Res Function(ProductsCategory) then) =
      _$ProductsCategoryCopyWithImpl<$Res, ProductsCategory>;
  @useResult
  $Res call(
      {int? id,
      String? image_url,
      String? category_name,
      List<Product>? products});
}

/// @nodoc
class _$ProductsCategoryCopyWithImpl<$Res, $Val extends ProductsCategory>
    implements $ProductsCategoryCopyWith<$Res> {
  _$ProductsCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image_url = freezed,
    Object? category_name = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      category_name: freezed == category_name
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsCategoryImplCopyWith<$Res>
    implements $ProductsCategoryCopyWith<$Res> {
  factory _$$ProductsCategoryImplCopyWith(_$ProductsCategoryImpl value,
          $Res Function(_$ProductsCategoryImpl) then) =
      __$$ProductsCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? image_url,
      String? category_name,
      List<Product>? products});
}

/// @nodoc
class __$$ProductsCategoryImplCopyWithImpl<$Res>
    extends _$ProductsCategoryCopyWithImpl<$Res, _$ProductsCategoryImpl>
    implements _$$ProductsCategoryImplCopyWith<$Res> {
  __$$ProductsCategoryImplCopyWithImpl(_$ProductsCategoryImpl _value,
      $Res Function(_$ProductsCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image_url = freezed,
    Object? category_name = freezed,
    Object? products = freezed,
  }) {
    return _then(_$ProductsCategoryImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == category_name
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsCategoryImpl implements _ProductsCategory {
  const _$ProductsCategoryImpl(this.id, this.image_url, this.category_name,
      final List<Product>? products)
      : _products = products;

  factory _$ProductsCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsCategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final String? image_url;
  @override
  final String? category_name;
  final List<Product>? _products;
  @override
  List<Product>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductsCategory(id: $id, image_url: $image_url, category_name: $category_name, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.category_name, category_name) ||
                other.category_name == category_name) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image_url, category_name,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsCategoryImplCopyWith<_$ProductsCategoryImpl> get copyWith =>
      __$$ProductsCategoryImplCopyWithImpl<_$ProductsCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsCategoryImplToJson(
      this,
    );
  }
}

abstract class _ProductsCategory implements ProductsCategory {
  const factory _ProductsCategory(
      final int? id,
      final String? image_url,
      final String? category_name,
      final List<Product>? products) = _$ProductsCategoryImpl;

  factory _ProductsCategory.fromJson(Map<String, dynamic> json) =
      _$ProductsCategoryImpl.fromJson;

  @override
  int? get id;
  @override
  String? get image_url;
  @override
  String? get category_name;
  @override
  List<Product>? get products;
  @override
  @JsonKey(ignore: true)
  _$$ProductsCategoryImplCopyWith<_$ProductsCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
