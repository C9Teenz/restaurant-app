// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageResponseModel _$ImageResponseModelFromJson(Map<String, dynamic> json) {
  return _ImageResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ImageResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  dynamic get alternativeText => throw _privateConstructorUsedError;
  dynamic get caption => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  Formats get formats => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get ext => throw _privateConstructorUsedError;
  String get mime => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  dynamic get previewUrl => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  dynamic get providerMetadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageResponseModelCopyWith<ImageResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageResponseModelCopyWith<$Res> {
  factory $ImageResponseModelCopyWith(
          ImageResponseModel value, $Res Function(ImageResponseModel) then) =
      _$ImageResponseModelCopyWithImpl<$Res, ImageResponseModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      dynamic alternativeText,
      dynamic caption,
      int width,
      int height,
      Formats formats,
      String hash,
      String ext,
      String mime,
      double size,
      String url,
      dynamic previewUrl,
      String provider,
      dynamic providerMetadata,
      DateTime createdAt,
      DateTime updatedAt});

  $FormatsCopyWith<$Res> get formats;
}

/// @nodoc
class _$ImageResponseModelCopyWithImpl<$Res, $Val extends ImageResponseModel>
    implements $ImageResponseModelCopyWith<$Res> {
  _$ImageResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? alternativeText = freezed,
    Object? caption = freezed,
    Object? width = null,
    Object? height = null,
    Object? formats = null,
    Object? hash = null,
    Object? ext = null,
    Object? mime = null,
    Object? size = null,
    Object? url = null,
    Object? previewUrl = freezed,
    Object? provider = null,
    Object? providerMetadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alternativeText: freezed == alternativeText
          ? _value.alternativeText
          : alternativeText // ignore: cast_nullable_to_non_nullable
              as dynamic,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      formats: null == formats
          ? _value.formats
          : formats // ignore: cast_nullable_to_non_nullable
              as Formats,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      ext: null == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerMetadata: freezed == providerMetadata
          ? _value.providerMetadata
          : providerMetadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormatsCopyWith<$Res> get formats {
    return $FormatsCopyWith<$Res>(_value.formats, (value) {
      return _then(_value.copyWith(formats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageResponseModelCopyWith<$Res>
    implements $ImageResponseModelCopyWith<$Res> {
  factory _$$_ImageResponseModelCopyWith(_$_ImageResponseModel value,
          $Res Function(_$_ImageResponseModel) then) =
      __$$_ImageResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      dynamic alternativeText,
      dynamic caption,
      int width,
      int height,
      Formats formats,
      String hash,
      String ext,
      String mime,
      double size,
      String url,
      dynamic previewUrl,
      String provider,
      dynamic providerMetadata,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $FormatsCopyWith<$Res> get formats;
}

/// @nodoc
class __$$_ImageResponseModelCopyWithImpl<$Res>
    extends _$ImageResponseModelCopyWithImpl<$Res, _$_ImageResponseModel>
    implements _$$_ImageResponseModelCopyWith<$Res> {
  __$$_ImageResponseModelCopyWithImpl(
      _$_ImageResponseModel _value, $Res Function(_$_ImageResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? alternativeText = freezed,
    Object? caption = freezed,
    Object? width = null,
    Object? height = null,
    Object? formats = null,
    Object? hash = null,
    Object? ext = null,
    Object? mime = null,
    Object? size = null,
    Object? url = null,
    Object? previewUrl = freezed,
    Object? provider = null,
    Object? providerMetadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_ImageResponseModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alternativeText: freezed == alternativeText
          ? _value.alternativeText
          : alternativeText // ignore: cast_nullable_to_non_nullable
              as dynamic,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      formats: null == formats
          ? _value.formats
          : formats // ignore: cast_nullable_to_non_nullable
              as Formats,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      ext: null == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerMetadata: freezed == providerMetadata
          ? _value.providerMetadata
          : providerMetadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageResponseModel implements _ImageResponseModel {
  const _$_ImageResponseModel(
      {required this.id,
      required this.name,
      required this.alternativeText,
      required this.caption,
      required this.width,
      required this.height,
      required this.formats,
      required this.hash,
      required this.ext,
      required this.mime,
      required this.size,
      required this.url,
      required this.previewUrl,
      required this.provider,
      required this.providerMetadata,
      required this.createdAt,
      required this.updatedAt});

  factory _$_ImageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImageResponseModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final dynamic alternativeText;
  @override
  final dynamic caption;
  @override
  final int width;
  @override
  final int height;
  @override
  final Formats formats;
  @override
  final String hash;
  @override
  final String ext;
  @override
  final String mime;
  @override
  final double size;
  @override
  final String url;
  @override
  final dynamic previewUrl;
  @override
  final String provider;
  @override
  final dynamic providerMetadata;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ImageResponseModel(id: $id, name: $name, alternativeText: $alternativeText, caption: $caption, width: $width, height: $height, formats: $formats, hash: $hash, ext: $ext, mime: $mime, size: $size, url: $url, previewUrl: $previewUrl, provider: $provider, providerMetadata: $providerMetadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.alternativeText, alternativeText) &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.formats, formats) || other.formats == formats) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.ext, ext) || other.ext == ext) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other.previewUrl, previewUrl) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            const DeepCollectionEquality()
                .equals(other.providerMetadata, providerMetadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(alternativeText),
      const DeepCollectionEquality().hash(caption),
      width,
      height,
      formats,
      hash,
      ext,
      mime,
      size,
      url,
      const DeepCollectionEquality().hash(previewUrl),
      provider,
      const DeepCollectionEquality().hash(providerMetadata),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageResponseModelCopyWith<_$_ImageResponseModel> get copyWith =>
      __$$_ImageResponseModelCopyWithImpl<_$_ImageResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageResponseModelToJson(
      this,
    );
  }
}

abstract class _ImageResponseModel implements ImageResponseModel {
  const factory _ImageResponseModel(
      {required final int id,
      required final String name,
      required final dynamic alternativeText,
      required final dynamic caption,
      required final int width,
      required final int height,
      required final Formats formats,
      required final String hash,
      required final String ext,
      required final String mime,
      required final double size,
      required final String url,
      required final dynamic previewUrl,
      required final String provider,
      required final dynamic providerMetadata,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_ImageResponseModel;

  factory _ImageResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ImageResponseModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  dynamic get alternativeText;
  @override
  dynamic get caption;
  @override
  int get width;
  @override
  int get height;
  @override
  Formats get formats;
  @override
  String get hash;
  @override
  String get ext;
  @override
  String get mime;
  @override
  double get size;
  @override
  String get url;
  @override
  dynamic get previewUrl;
  @override
  String get provider;
  @override
  dynamic get providerMetadata;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ImageResponseModelCopyWith<_$_ImageResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Formats _$FormatsFromJson(Map<String, dynamic> json) {
  return _Formats.fromJson(json);
}

/// @nodoc
mixin _$Formats {
  Small get thumbnail => throw _privateConstructorUsedError;
  Small get small => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormatsCopyWith<Formats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormatsCopyWith<$Res> {
  factory $FormatsCopyWith(Formats value, $Res Function(Formats) then) =
      _$FormatsCopyWithImpl<$Res, Formats>;
  @useResult
  $Res call({Small thumbnail, Small small});

  $SmallCopyWith<$Res> get thumbnail;
  $SmallCopyWith<$Res> get small;
}

/// @nodoc
class _$FormatsCopyWithImpl<$Res, $Val extends Formats>
    implements $FormatsCopyWith<$Res> {
  _$FormatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = null,
    Object? small = null,
  }) {
    return _then(_value.copyWith(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Small,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as Small,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SmallCopyWith<$Res> get thumbnail {
    return $SmallCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SmallCopyWith<$Res> get small {
    return $SmallCopyWith<$Res>(_value.small, (value) {
      return _then(_value.copyWith(small: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FormatsCopyWith<$Res> implements $FormatsCopyWith<$Res> {
  factory _$$_FormatsCopyWith(
          _$_Formats value, $Res Function(_$_Formats) then) =
      __$$_FormatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Small thumbnail, Small small});

  @override
  $SmallCopyWith<$Res> get thumbnail;
  @override
  $SmallCopyWith<$Res> get small;
}

/// @nodoc
class __$$_FormatsCopyWithImpl<$Res>
    extends _$FormatsCopyWithImpl<$Res, _$_Formats>
    implements _$$_FormatsCopyWith<$Res> {
  __$$_FormatsCopyWithImpl(_$_Formats _value, $Res Function(_$_Formats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = null,
    Object? small = null,
  }) {
    return _then(_$_Formats(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Small,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as Small,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Formats implements _Formats {
  const _$_Formats({required this.thumbnail, required this.small});

  factory _$_Formats.fromJson(Map<String, dynamic> json) =>
      _$$_FormatsFromJson(json);

  @override
  final Small thumbnail;
  @override
  final Small small;

  @override
  String toString() {
    return 'Formats(thumbnail: $thumbnail, small: $small)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Formats &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.small, small) || other.small == small));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, thumbnail, small);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormatsCopyWith<_$_Formats> get copyWith =>
      __$$_FormatsCopyWithImpl<_$_Formats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormatsToJson(
      this,
    );
  }
}

abstract class _Formats implements Formats {
  const factory _Formats(
      {required final Small thumbnail,
      required final Small small}) = _$_Formats;

  factory _Formats.fromJson(Map<String, dynamic> json) = _$_Formats.fromJson;

  @override
  Small get thumbnail;
  @override
  Small get small;
  @override
  @JsonKey(ignore: true)
  _$$_FormatsCopyWith<_$_Formats> get copyWith =>
      throw _privateConstructorUsedError;
}

Small _$SmallFromJson(Map<String, dynamic> json) {
  return _Small.fromJson(json);
}

/// @nodoc
mixin _$Small {
  String get name => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get ext => throw _privateConstructorUsedError;
  String get mime => throw _privateConstructorUsedError;
  dynamic get path => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmallCopyWith<Small> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmallCopyWith<$Res> {
  factory $SmallCopyWith(Small value, $Res Function(Small) then) =
      _$SmallCopyWithImpl<$Res, Small>;
  @useResult
  $Res call(
      {String name,
      String hash,
      String ext,
      String mime,
      dynamic path,
      int width,
      int height,
      double size,
      String url});
}

/// @nodoc
class _$SmallCopyWithImpl<$Res, $Val extends Small>
    implements $SmallCopyWith<$Res> {
  _$SmallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hash = null,
    Object? ext = null,
    Object? mime = null,
    Object? path = freezed,
    Object? width = null,
    Object? height = null,
    Object? size = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      ext: null == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SmallCopyWith<$Res> implements $SmallCopyWith<$Res> {
  factory _$$_SmallCopyWith(_$_Small value, $Res Function(_$_Small) then) =
      __$$_SmallCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String hash,
      String ext,
      String mime,
      dynamic path,
      int width,
      int height,
      double size,
      String url});
}

/// @nodoc
class __$$_SmallCopyWithImpl<$Res> extends _$SmallCopyWithImpl<$Res, _$_Small>
    implements _$$_SmallCopyWith<$Res> {
  __$$_SmallCopyWithImpl(_$_Small _value, $Res Function(_$_Small) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hash = null,
    Object? ext = null,
    Object? mime = null,
    Object? path = freezed,
    Object? width = null,
    Object? height = null,
    Object? size = null,
    Object? url = null,
  }) {
    return _then(_$_Small(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      ext: null == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Small implements _Small {
  const _$_Small(
      {required this.name,
      required this.hash,
      required this.ext,
      required this.mime,
      required this.path,
      required this.width,
      required this.height,
      required this.size,
      required this.url});

  factory _$_Small.fromJson(Map<String, dynamic> json) =>
      _$$_SmallFromJson(json);

  @override
  final String name;
  @override
  final String hash;
  @override
  final String ext;
  @override
  final String mime;
  @override
  final dynamic path;
  @override
  final int width;
  @override
  final int height;
  @override
  final double size;
  @override
  final String url;

  @override
  String toString() {
    return 'Small(name: $name, hash: $hash, ext: $ext, mime: $mime, path: $path, width: $width, height: $height, size: $size, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Small &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.ext, ext) || other.ext == ext) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, hash, ext, mime,
      const DeepCollectionEquality().hash(path), width, height, size, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SmallCopyWith<_$_Small> get copyWith =>
      __$$_SmallCopyWithImpl<_$_Small>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmallToJson(
      this,
    );
  }
}

abstract class _Small implements Small {
  const factory _Small(
      {required final String name,
      required final String hash,
      required final String ext,
      required final String mime,
      required final dynamic path,
      required final int width,
      required final int height,
      required final double size,
      required final String url}) = _$_Small;

  factory _Small.fromJson(Map<String, dynamic> json) = _$_Small.fromJson;

  @override
  String get name;
  @override
  String get hash;
  @override
  String get ext;
  @override
  String get mime;
  @override
  dynamic get path;
  @override
  int get width;
  @override
  int get height;
  @override
  double get size;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_SmallCopyWith<_$_Small> get copyWith =>
      throw _privateConstructorUsedError;
}
