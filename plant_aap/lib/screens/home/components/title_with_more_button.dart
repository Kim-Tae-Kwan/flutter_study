import 'package:flutter/material.dart';
import 'package:plant_aap/constants.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    Key? key, required this.title, required this.onPress,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleWithCustomUnderline(
            title: title,
          ),
          MaterialButton(
            onPressed: onPress,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            color: kPrimaryColor,
            child: const Text(
              'More',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(right: kDefaultPadding / 4),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 7,
            margin: const EdgeInsets.only(right: kDefaultPadding / 4),
            color: kPrimaryColor.withOpacity(0.2),
          ),
        ),
      ]),
    );
  }
}