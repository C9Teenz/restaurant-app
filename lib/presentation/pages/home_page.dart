import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/data/models/responses/add_product/add_product_response_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../cubit/all_restaurant/get_all_product_cubit.dart';
import '../../data/models/responses/products/products_response_model.dart';
import '../widgets/card_item_restaurant.dart';

import '../../routes/app_pages.dart';
import 'dart:math';

import '../widgets/card_new_item_restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageN = 0;
  bool isNextN = true;
  int rng = Random().nextInt(3) + 3;
  List<Restaurant> restaurant = [];
  final controller = ScrollController();
  @override
  void initState() {
    context.read<GetAllProductCubit>().getRestaurants();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("mentok bro")));

        context.read<GetAllProductCubit>().nextRestaurant(
            restaurant: restaurant, isNext: isNextN, page: pageN);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "List Restaurant",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      color: Colors.amber[900]),
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ]),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<GetAllProductCubit, GetAllProductState>(
                      builder: (context, state) {
                        return state.when(
                            initial: () => const Center(
                                  child: Text("no Data"),
                                ),
                            loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            error: (message) => const Center(
                                  child: Text("Error"),
                                ),
                            loaded: (model, page, isNext) {
                              pageN = page!;
                              isNextN = isNext!;
                              restaurant = model;
                              return GridView.builder(
                                controller: controller,
                                shrinkWrap: false,
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 210 / 350,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemCount:
                                    isNext ? model.length + 2 : model.length,
                                itemBuilder: (context, index) {
                                  if (isNext && index == model.length ||
                                      index == model.length + 1) {
                                    return Shimmer.fromColors(
                                        baseColor: Colors.grey[800]!,
                                        highlightColor: Colors.grey[600]!,
                                        child: Container(
                                          width: double.infinity,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                        ));
                                  } else {
                                    return InkWell(
                                      onTap: () =>
                                          // context.push('${Routes.detail}/$data'),
                                          context.push(Routes.detail,
                                              extra: model[index]),
                                      child: CardNewItemRestaurant(
                                          data: model[index], rating: rng),
                                    );
                                  }
                                },
                              );
                            });
                      },
                    )),
              ),
            ],
          ),
        ));
  }
}
