import 'package:go_router/go_router.dart';
import 'package:restaurant/presentation/pages/add_restaurant_page.dart';
import '../data/models/gmap_model.dart';
import '../data/models/responses/add_product/add_product_response_model.dart';
import '../presentation/pages/detail_map_page.dart';
import '../presentation/pages/detail_restaurant_page.dart';

import '../presentation/pages/gmap_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/main_page.dart';
import '../presentation/pages/my_account_page.dart';
import '../presentation/pages/register_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: Routes.detail,
        builder: (context, state) {
          Restaurant data = state.extra as Restaurant;
          return DetailRestaurantPage(data: data);
        }),
    GoRoute(path: Routes.gmap,builder: (context, state) {
      GmapModel gmap=state.extra as GmapModel;
      return GmapPage(lat: gmap.latLng!.latitude, long: gmap.latLng!.longitude);
    },),
    GoRoute(
      path: Routes.account,
      builder: (context, state) => const MyAccountPage(),
    ),
    GoRoute(
      path: Routes.main,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: Routes.add,
      builder: (context, state) => const AddRestaurantPage(),
    ),
  ];
}
