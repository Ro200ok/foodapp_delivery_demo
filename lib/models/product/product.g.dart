// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      json['id'] as int?,
      json['name'] as String?,
      json['image_url'] as String?,
      json['cost'] as int?,
      json['sizes'] as String?,
      json['categoryId'] as int?,
      json['description'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.image_url,
      'cost': instance.cost,
      'sizes': instance.sizes,
      'categoryId': instance.categoryId,
      'description': instance.description,
    };
