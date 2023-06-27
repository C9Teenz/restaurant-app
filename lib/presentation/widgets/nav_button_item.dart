// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/cubit/navbar/navbar_cubit.dart';

class NavButtonItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final String label;
  const NavButtonItem({
    Key? key,
    required this.icon,
    required this.index,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(),
            IconButton(
              onPressed: () {
                context.read<NavbarCubit>().changeIndex(index);
              },
              icon: Icon(
                icon,
                size: 28,
                color: state == index ? Colors.amber[900] : Colors.grey,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: state == index ? Colors.amber[900] : Colors.grey,
              ),
            )
          ],
        );
      },
    );
  }
}
