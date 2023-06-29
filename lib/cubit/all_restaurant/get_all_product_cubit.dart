// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant/data/datasource/remote_datasource/product_datasource.dart';

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
    final result = await data.getProducts();
    result.fold((l) => emit( _Error(l)), (r) => emit(_Loaded(r)));
  }
}
