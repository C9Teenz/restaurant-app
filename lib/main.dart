import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/cubit/add_restaurant/add_product_cubit.dart';
import 'package:restaurant/cubit/login/login_cubit.dart';
import 'package:restaurant/cubit/register/register_cubit.dart';
import 'package:restaurant/data/datasource/remote_datasource/auth_datasource.dart';
import 'package:restaurant/data/datasource/remote_datasource/gmap_datasource.dart';
import 'cubit/all_restaurant/get_all_product_cubit.dart';
import 'cubit/google_map/google_map_cubit.dart';
import 'routes/app_pages.dart';

import 'cubit/navbar/navbar_cubit.dart';
import 'data/datasource/remote_datasource/product_datasource.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
          create: (context) => GoogleMapCubit (GmapDatasource()),
        ),
        BlocProvider<AddProductCubit>(
          create: (context) => AddProductCubit (ProductDataSource()),
        ),
      ],
      child: MaterialApp.router(
        title: "Restaurant-app",
        debugShowCheckedModeBanner: false,
        routerConfig:
            GoRouter(routes: AppPages.routes, initialLocation: Routes.main),
      ),
    );
  }
}
