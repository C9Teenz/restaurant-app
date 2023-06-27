// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant/data/datasource/remote_datasource/product_datasource.dart';

import '../../data/models/responses/add_product/add_product_response_model.dart';

part 'add_product_cubit.freezed.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ProductDataSource data;
  AddProductCubit(
    this.data,
  ) : super(const AddProductState.initial());
  
}
