
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_aap/constants.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key, required this.iconImagePath,
  }) : super(key: key);

  final String iconImagePath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 15),
                color: kPrimaryColor.withOpacity(0.22),
                blurRadius: 22
            ),
            const BoxShadow(
                offset: Offset(-15, -15),
                color: Colors.white,
                blurRadius: 20
            )
          ]
      ),
      child: SvgPicture.asset(iconImagePath),
    );
  }
}