// To parse this JSON data, do
//
//     final imageResponseModel = imageResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'image_response_model.freezed.dart';
part 'image_response_model.g.dart';

List<ImageResponseModel> imageResponseModelFromJson(String str) => List<ImageResponseModel>.from(json.decode(str).map((x) => ImageResponseModel.fromJson(x)));

String imageResponseModelToJson(List<ImageResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ImageResponseModel with _$ImageResponseModel {
    const factory ImageResponseModel({
        required int id,
        required String name,
        required dynamic alternativeText,
        required dynamic caption,
        required int width,
        required int height,
        required Formats formats,
        required String hash,
        required String ext,
        required String mime,
        required double size,
        required String url,
        required dynamic previewUrl,
        required String provider,
        required dynamic providerMetadata,
        required DateTime createdAt,
        required DateTime updatedAt,
    }) = _ImageResponseModel;

    factory ImageResponseModel.fromJson(Map<String, dynamic> json) => _$ImageResponseModelFromJson(json);
}

@freezed
class Formats with _$Formats {
    const factory Formats({
        required Small thumbnail,
        required Small small,
    }) = _Formats;

    factory Formats.fromJson(Map<String, dynamic> json) => _$FormatsFromJson(json);
}

@freezed
class Small with _$Small {
    const factory Small({
        required String name,
        required String hash,
        required String ext,
        required String mime,
        required dynamic path,
        required int width,
        required int height,
        required double size,
        required String url,
    }) = _Small;

    factory Small.fromJson(Map<String, dynamic> json) => _$SmallFromJson(json);
}
