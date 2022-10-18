import 'package:flutter/material.dart';
import 'package:plant_aap/constants.dart';
import 'package:plant_aap/screens/detail/conponents/content.dart';
import 'package:plant_aap/screens/detail/conponents/header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          Content(
            title: 'Angellca',
            country: 'Russia',
            price: 440,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Row(
              children: [
                SizedBox(
                  height: 80,
                  width: size.width / 2,
                  child: Expanded(
                    child: MaterialButton(
                      onPressed: () {
                      },
                      color: kPrimaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20)
                        )
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                    },
                    child: const Text('Descriptoin'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
