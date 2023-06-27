// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';


import 'package:restaurant/data/models/responses/add_product/add_product_response_model.dart';



class CardItemRestaurant extends StatelessWidget {
  final Restaurant data;
  const CardItemRestaurant({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(9), topRight: Radius.circular(9)),
                image: DecorationImage(
                    image: NetworkImage(data.attributes.photo),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16),
            child: Text(data.attributes.name),
          )
        ],
      ),
    );
  }
}
