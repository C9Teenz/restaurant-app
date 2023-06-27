import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/common/constant.dart';
import 'package:restaurant/data/datasource/local_datasource/auth_local.dart';
import 'package:restaurant/data/models/responses/add_product/add_product_response_model.dart';

import '../../models/requests/add_product/add_product_request_model.dart';

import '../../models/responses/products/products_response_model.dart';

class ProductDataSource {
  final dio = Dio();
  Future<Either<String, ProductsResponseModel>> getProducts() async {
    final response = await dio.get("${Constant.baseUrl}api/restaurants");
    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.data));
    } else {
      return const Left("Get Products Failed");
    }
  }
  Future<Either<String,AddProductResponseModel>>addProduct(AddProductRequestModel model)async{
    final token=AuthLocal.getToken();
    dio.options.headers["authorization"] = "token $token";
    final response = await dio.post("${Constant.baseUrl}api/restaurants",data: model.toJson());
    if(response.statusCode==200){
      return Right(AddProductResponseModel.fromJson(response.data));
    }else{
      return const Left("Add Product Failed");
    }
  }
}
