// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageResponseModel _$$_ImageResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_ImageResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      alternativeText: json['alternativeText'],
      caption: json['caption'],
      width: json['width'] as int,
      height: json['height'] as int,
      formats: Formats.fromJson(json['formats'] as Map<String, dynamic>),
      hash: json['hash'] as String,
      ext: json['ext'] as String,
      mime: json['mime'] as String,
      size: (json['size'] as num).toDouble(),
      url: json['url'] as String,
      previewUrl: json['previewUrl'],
      provider: json['provider'] as String,
      providerMetadata: json['providerMetadata'],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ImageResponseModelToJson(
        _$_ImageResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternativeText': instance.alternativeText,
      'caption': instance.caption,
      'width': instance.width,
      'height': instance.height,
      'formats': instance.formats,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'size': instance.size,
      'url': instance.url,
      'previewUrl': instance.previewUrl,
      'provider': instance.provider,
      'providerMetadata': instance.providerMetadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$_Formats _$$_FormatsFromJson(Map<String, dynamic> json) => _$_Formats(
      thumbnail: Small.fromJson(json['thumbnail'] as Map<String, dynamic>),
      small: Small.fromJson(json['small'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FormatsToJson(_$_Formats instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'small': instance.small,
    };

_$_Small _$$_SmallFromJson(Map<String, dynamic> json) => _$_Small(
      name: json['name'] as String,
      hash: json['hash'] as String,
      ext: json['ext'] as String,
      mime: json['mime'] as String,
      path: json['path'],
      width: json['width'] as int,
      height: json['height'] as int,
      size: (json['size'] as num).toDouble(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_SmallToJson(_$_Small instance) => <String, dynamic>{
      'name': instance.name,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'path': instance.path,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'url': instance.url,
    };
