import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_aap/constants.dart';
import 'package:plant_aap/screens/detail/conponents/icon_card.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: [
                    // Align 추가 이유?
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
                      ),
                    ),
                    const Spacer(),
                    const IconCard(iconImagePath: 'assets/icons/sun.svg'),
                    const IconCard(iconImagePath: 'assets/icons/icon_2.svg'),
                    const IconCard(iconImagePath: 'assets/icons/icon_3.svg'),
                    const IconCard(iconImagePath: 'assets/icons/icon_4.svg'),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 10),
                        color: kPrimaryColor.withOpacity(0.29),
                        blurRadius: 60
                    )
                  ],
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomLeft,
                      image: AssetImage('assets/images/img.png')
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}