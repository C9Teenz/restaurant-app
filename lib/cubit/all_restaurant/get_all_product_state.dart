part of 'get_all_product_cubit.dart';

@freezed
class GetAllProductState with _$GetAllProductState {
  const factory GetAllProductState.initial() = _Initial;
  const factory GetAllProductState.loading() = _Loading;
  const factory GetAllProductState.loaded(List<Restaurant> model,int? page,bool? isNext) = _Loaded;
  const factory GetAllProductState.error(String msg) = _Error;
}
