// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant/data/datasource/remote_datasource/gmap_datasource.dart';

import '../../data/models/gmap_model.dart';

part 'google_map_cubit.freezed.dart';
part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  final GmapDatasource data;
  GoogleMapCubit(
    this.data,
  ) : super(const GoogleMapState.initial());

  void getCurrentLocation() async {
    emit(const _Loading());
    final result = await data.getCurrentPosition();
    result.fold(
      (l) => emit(
        _Error(l),
      ),
      (r) => emit(
        _Loaded(r),
      ),
    );
  }

  void getMarkLocation({required double lat, required double long}) async {
    emit(const _Loading());
    final result = await data.getPosition(lat: lat, long: long);
    result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
  }
}
