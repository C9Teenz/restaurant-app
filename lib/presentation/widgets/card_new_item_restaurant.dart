// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:restaurant/data/models/responses/add_product/add_product_response_model.dart';

class CardNewItemRestaurant extends StatelessWidget {
  final Restaurant data;
  final int rating;
  const CardNewItemRestaurant({
    Key? key,
    required this.data,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 200 / 323,
      child: Container(
        height: 323,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data.attributes.photo),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 55,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        width: 15,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.attributes.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data.attributes.description,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[500],
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
