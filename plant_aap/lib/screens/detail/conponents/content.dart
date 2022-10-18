import 'package:flutter/material.dart';
import 'package:plant_aap/constants.dart';

class Content extends StatelessWidget {
  const Content({
    Key? key, required this.title, required this.country, required this.price,
  }) : super(key: key);

  final String title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kTextColor
                ),
              ),
              Text(
                country,
                style: const TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor
                ),
              ),
            ],
          ),
          Text(
            '\$$price',
            style: const TextStyle(
                fontSize: 20,
                color: kPrimaryColor
            ),
          )
        ],
      ),
    );
  }
}