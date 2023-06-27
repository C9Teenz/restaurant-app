// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant/data/datasource/local_datasource/auth_local.dart';

import 'package:restaurant/data/datasource/remote_datasource/auth_datasource.dart';
import 'package:restaurant/data/models/requests/login/login_request_model.dart';

import '../../data/models/responses/auth/auth_response_model.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthDataSource data;
  LoginCubit(
    this.data,
  ) : super(const LoginState.initial());

  void login(LoginRequestModel model) async {
    emit(const _Loading());
    final result = await data.login(model);
    result.fold((l) => emit(_Error(l)), (r) async {
      await AuthLocal.saveAuthData(r);
      emit(_Loaded(r));
    });
  }
}
