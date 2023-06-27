import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/cubit/navbar/navbar_cubit.dart';
import 'package:restaurant/data/datasource/local_datasource/auth_local.dart';
import 'package:restaurant/data/models/responses/add_product/add_product_response_model.dart';
import 'package:restaurant/presentation/pages/detail_restaurant_page.dart';

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
    GoRoute(
      path: Routes.account,
      builder: (context, state) => const MyAccountPage(),
    ),
    GoRoute(
      path: Routes.main,
      builder: (context, state) => const MainPage(),
      // redirect: ((context, state) async {
      //   final index = context.watch<NavbarCubit>().state;
      //   final isLogin = await AuthLocal.isLogin();

      //   if (isLogin == false && index == 1) {
      //     return Routes.login;
      //   } else {
      //     return null;
      //   }
      // }),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterPage(),
    ),
  ];
}
