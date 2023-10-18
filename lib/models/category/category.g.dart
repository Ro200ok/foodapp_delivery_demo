// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsCategoryImpl _$$ProductsCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductsCategoryImpl(
      json['id'] as int?,
      json['image_url'] as String?,
      json['category_name'] as String?,
      (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductsCategoryImplToJson(
        _$ProductsCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.image_url,
      'category_name': instance.category_name,
      'products': instance.products,
    };
