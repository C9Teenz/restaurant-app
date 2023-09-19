// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:restaurant/cubit/add_restaurant/add_product_cubit.dart';
import 'package:restaurant/cubit/login/login_cubit.dart';
import 'package:restaurant/cubit/profile/profile_cubit.dart';
import 'package:restaurant/cubit/register/register_cubit.dart';
import 'package:restaurant/data/datasource/remote_datasource/auth_datasource.dart';
import 'package:restaurant/data/datasource/remote_datasource/gmap_datasource.dart';

import 'cubit/all_restaurant/get_all_product_cubit.dart';
import 'cubit/google_map/google_map_cubit.dart';
import 'cubit/navbar/navbar_cubit.dart';
import 'data/datasource/remote_datasource/product_datasource.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String isLogin = prefs.getString('authdata') ?? "";
  runApp(MainApp(
    isLogin: isLogin.isNotEmpty,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
    required this.isLogin,
  }) : super(key: key);
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavbarCubit>(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider<GetAllProductCubit>(
          create: (context) => GetAllProductCubit(ProductDataSource()),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(AuthDataSource()),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(AuthDataSource()),
        ),
        BlocProvider<GoogleMapCubit>(
          create: (context) => GoogleMapCubit(GmapDatasource()),
        ),
        BlocProvider<AddProductCubit>(
          create: (context) => AddProductCubit(ProductDataSource()),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(AuthDataSource()),
        ),
      ],
      child: MaterialApp.router(
        title: "Restaurant-app",
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
            routes: AppPages.routes,
            initialLocation: isLogin ? Routes.main : Routes.login),
      ),
    );
  }
}
