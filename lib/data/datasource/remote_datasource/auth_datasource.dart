import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/common/constant.dart';

import 'package:restaurant/data/models/responses/auth/auth_response_model.dart';

import '../../models/requests/login/login_request_model.dart';
import '../../models/requests/register/register_request_model.dart';

class AuthDataSource {
  var dio = Dio();
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await dio.post(
        "${Constant.baseUrl}api/auth/local/register",
        data: model.toJson());
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.data));
    } else {
      return const Left("Register Failed");
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel model) async {
    final response = await dio.post("${Constant.baseUrl}api/auth/local",
        data: model.toJson());
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.data));
    } else {
      return const Left("Login Failed");
    }
  }
}
