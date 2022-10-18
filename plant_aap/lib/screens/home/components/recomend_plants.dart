import 'package:flutter/material.dart';
import 'package:plant_aap/constants.dart';

class RecomendPlants extends StatelessWidget {
  const RecomendPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ReomendPlantCard(
            onPress: (){},
            title: 'samantha',
            country: 'russia',
            price: 440,
            imagePath: 'assets/images/image_1.png',
          ),
          ReomendPlantCard(
            onPress: (){},
            title: 'samantha',
            country: 'russia',
            price: 440,
            imagePath: 'assets/images/image_2.png',
          ),
          ReomendPlantCard(
            onPress: (){},
            title: 'samantha',
            country: 'russia',
            price: 440,
            imagePath: 'assets/images/image_3.png',
          ),
          ReomendPlantCard(
            onPress: (){},
            title: 'samantha',
            country: 'russia',
            price: 440,
            imagePath: 'assets/images/image_1.png',
          ),
        ],
      ),
    );
  }
}

class ReomendPlantCard extends StatelessWidget {
  const ReomendPlantCard({
    Key? key, required this.imagePath, required this.title, required this.country, required this.price, required this.onPress,
  }) : super(key: key);

  final String imagePath, title, country;
  final int price;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(imagePath),
          GestureDetector(
            onTap: onPress,
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0,10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23)
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: '$title\n'.toUpperCase(),
                              style: Theme.of(context).textTheme.button
                          ),
                          TextSpan(
                              text: country.toUpperCase(),
                              style: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.5)
                              )
                          ),
                        ]
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.button!.copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}