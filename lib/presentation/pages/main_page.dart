import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/cubit/navbar/navbar_cubit.dart';
import 'package:restaurant/presentation/pages/my_account_page.dart';

import '../widgets/nav_button_item.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int newCurrentPage) {
      switch (newCurrentPage) {
        case 0:
          return const HomePage();
        case 1:
          return const MyAccountPage();

        default:
          return const HomePage();
      }
    }
Widget customButtonNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin:const EdgeInsets.only(
              left: 24, right: 24, bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child:const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavButtonItem(
                icon: Icons.local_restaurant_outlined,
                index: 0,
                label: "All Restaurant",
              ),
              NavButtonItem(
             icon: Icons.people,
                index: 1,
                label: "My Account",
              ),
             
            ],
          ),
        ),
      );
    }
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        print(state);
       return  Scaffold(
          body: Stack(
            children: [buildContent(state),customButtonNav()],
          ),
        );
      },
    );
  }
}
