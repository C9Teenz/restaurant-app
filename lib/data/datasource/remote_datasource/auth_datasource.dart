import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/common/constant.dart';
import 'package:restaurant/data/datasource/local_datasource/auth_local.dart';

import 'package:restaurant/data/models/responses/auth/auth_response_model.dart';
import 'package:restaurant/data/models/responses/profile/profile_model.dart';

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

  Future<Either<String,ProfileModel>>getProfile()async{
    final id=await AuthLocal.getUserId();
   final token =await AuthLocal.getToken();
   dio.options.headers["authorization"]="bearer $token";
    final response=await dio.get("${Constant.baseUrl}api/users/$id");
    if(response.statusCode==200){
      return Right(ProfileModel.fromJson(response.data));
    }else{
      return const Left("Get Profile Failed");
    }
  }
}
