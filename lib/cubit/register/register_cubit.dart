// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant/data/datasource/remote_datasource/auth_datasource.dart';
import 'package:restaurant/data/models/requests/register/register_request_model.dart';

import '../../data/models/responses/auth/auth_response_model.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthDataSource data;
  RegisterCubit(
    this.data,
  ) : super(const RegisterState.initial());

  void register(RegisterRequestModel model) async {
    emit(const _Loading());
    final result = await data.register(model);
    result.fold((error) {
      emit(_Error("something happen $error"));
    }, (r) {
      emit(_Loaded(r));
    });
  }
}
