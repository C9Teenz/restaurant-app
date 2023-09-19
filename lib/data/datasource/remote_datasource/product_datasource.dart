import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/common/constant.dart';
import 'package:restaurant/data/datasource/local_datasource/auth_local.dart';
import 'package:restaurant/data/models/responses/add_product/add_product_response_model.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/requests/add_product/add_product_request_model.dart';
import 'package:http/http.dart' as http;
import '../../models/responses/products/products_response_model.dart';
import '../../models/responses/upload_images/image_response_model.dart';

class ProductDataSource {
  final dio = Dio();
  Future<Either<String, ProductsResponseModel>> getProducts(
      {required int page}) async {
    final token = await AuthLocal.getToken();

    try {
      var response = await Dio().get(
        "${Constant.baseUrl}api/restaurants?pagination[page]=$page&pagination[pageSize]=10",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      return Right(ProductsResponseModel.fromJson(response.data));
    } catch (e) {
      return Left("$e");
    }
  }

  // Future<Either<String, AddProductResponseModel>> addProduct(
  //     AddProductRequestModel model) async {
  //   final token = await AuthLocal.getToken();
  //   Map<String, dynamic> data = model.toJson();
  //   data['data'] = model.data.toJson();
  //   // dio.options.headers["authorization"] = "token $token";
  //   // // dio.options.headers['content-Type'] = 'application/json';
  //   // final response =
  //   //     await dio.post("${Constant.baseUrl}api/restaurants", data: data);
  //   // if (response.statusCode == 200) {
  //   //   return Right(AddProductResponseModel.fromJson(response.data));
  //   // } else {
  //   //   return const Left("Add Product Failed");
  //   // }
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };

  //   var request =
  //       http.Request('POST', Uri.parse("${Constant.baseUrl}api/restaurants"));
  //   request.body = jsonEncode(data);
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   final Uint8List responseList = await response.stream.toBytes();
  //   final String responseData = String.fromCharCodes(responseList);
  //   if (response.statusCode == 200) {
  //     return Right(AddProductResponseModel.fromJson(jsonDecode(responseData)));
  //   } else {
  //     return const Left("add failed");
  //   }
  // }
  Future<Either<String, AddProductResponseModel>> addProduct(
      AddProductRequestModel model) async {
    final token = await AuthLocal.getToken();
    Map<String, dynamic> data = model.toJson();
    data['data'] = model.data.toJson();
    final response = await http.post(
      Uri.parse('${Constant.baseUrl}api/restaurants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Right(
        AddProductResponseModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } else {
      return const Left('API ERROR');
    }
  }

  Future<Either<String, ImageResponseModel>> uploadImage(XFile image) async {
    final token = await AuthLocal.getToken();

    // final formData = FormData();
    // formData.files.add(MapEntry(
    //   'files',
    //   await MultipartFile.fromFile(image.path, filename: image.name),
    // ));
    // final response = await dio.post("http://103.150.116.14:1337/api/upload",
    //     options: Options(headers: {
    //       "authorization": "token $token",
    //       "Content-Type": "application/json"
    //     }),
    //     data: formData);

    // if (response.statusCode == 200) {
    //   return Right(ImageResponseModel.fromJson(response.data));
    // } else {
    //   return const Left("Upload Image Failed");
    // }

    final request = http.MultipartRequest(
      'POST',
      Uri.parse("http://103.150.116.14:1337/api/upload"),
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Content-Type'] = 'application/json';
    final bytes = await image.readAsBytes();

    final multiPartFile =
        http.MultipartFile.fromBytes('files', bytes, filename: image.name);

    request.files.add(multiPartFile);

    http.StreamedResponse response = await request.send();

    final Uint8List responseList = await response.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (response.statusCode == 200) {
      final x = imageResponseModelFromJson(responseData);

      return Right(x[0]);
    } else {
      return const Left('error upload image');
    }
  }
}
