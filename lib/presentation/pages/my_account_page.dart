import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/cubit/profile/profile_cubit.dart';
import 'package:restaurant/routes/app_pages.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "My Account",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    color: Colors.amber[900]),
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const Center(
                            child: Text("no Data"),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          loaded: (model) {
                            return SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    size: 200,
                                  ),
                                  Text(model.username),
                                  Text(model.email)
                                ],
                              ),
                            );
                          },
                          error: (message) => const Center(
                            child: Text("Error"),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Restaurant",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.amber[900],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                context.push(Routes.add);
                              },
                              icon: const Icon(Icons.add))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(9)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[900]),
                        onPressed: () {
                          // final request = LoginRequestModel(
                          //     identifier: identity!.text,
                          //     password: password!.text);
                          // if (_formKey.currentState!.validate()) {
                          //   context.read<LoginCubit>().login(request);
                          // }
                        },
                        child: const Text("Logout"),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
