import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubit/all_restaurant/get_all_product_cubit.dart';
import '../widgets/card_item_restaurant.dart';

import '../../routes/app_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<GetAllProductCubit>().getRestaurants();
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
                            loaded: (model) {
                              return GridView.builder(
                                shrinkWrap: false,
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        // childAspectRatio: 1,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemCount: model.data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () =>
                                        // context.push('${Routes.detail}/$data'),
                                        context.push(Routes.detail,
                                            extra: model.data[index]),
                                    child: CardItemRestaurant(
                                        data: model.data[index]),
                                  );
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
