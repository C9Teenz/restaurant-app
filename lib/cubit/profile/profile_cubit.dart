// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant/data/datasource/remote_datasource/auth_datasource.dart';
import 'package:restaurant/data/models/responses/profile/profile_model.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  AuthDataSource data;
  ProfileCubit(
    this.data,
  ) : super(const _Initial());

  void getProfile() async {
    emit(const _Loading());
    final result = await data.getProfile();
    result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
  }
}
