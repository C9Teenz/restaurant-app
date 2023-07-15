// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant/data/datasource/remote_datasource/product_datasource.dart';

import '../../data/models/responses/add_product/add_product_response_model.dart';
import '../../data/models/responses/products/products_response_model.dart';

part 'get_all_product_cubit.freezed.dart';
part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  final ProductDataSource data;
  GetAllProductCubit(
    this.data,
  ) : super(const GetAllProductState.initial());
  void getRestaurants() async {
    emit(const _Loading());
    final result = await data.getProducts(page: 1);
    result.fold((l) => emit(_Error(l)), (r) {
      bool isNext = r.data.length == 10;
      emit(_Loaded(r.data, 1, isNext));
    });
  }

  void nextRestaurant(
      {required List<Restaurant> restaurant,
      required int page,
      required bool isNext}) async {
    final result = await data.getProducts(page: page + 1);
    result.fold((l) => emit(_Error(l)), (r) {
      bool isNext = r.data.length == 10;

      emit(_Loaded([...restaurant, ...r.data], page + 1, isNext));
    });
  }
}
