import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_aap/constants.dart';
import 'package:plant_aap/screens/home/components/featured_plants.dart';
import 'package:plant_aap/screens/home/components/header_with_searchbox.dart';
import 'package:plant_aap/screens/home/components/recomend_plants.dart';
import 'package:plant_aap/screens/home/components/title_with_more_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //디바이스 사이즈 받기.
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreButton(
            title: 'Recomended',
            onPress: () {},
          ),
          const RecomendPlants(),
          TitleWithMoreButton(
            title: 'Featured Plants',
            onPress: () {},
          ),
          const FeaturedPlants(),
        ],
      ),
    );
  }
}