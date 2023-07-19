// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@freezed
class ProfileModel with _$ProfileModel {
    const factory ProfileModel({
        required int id,
        required String username,
        required String email,
        required String provider,
        required bool confirmed,
        required bool blocked,
        required DateTime createdAt,
        required DateTime updatedAt,
    }) = _ProfileModel;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
}
