import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart/contants.dart';

class ShoppingCartHeader extends StatefulWidget {
  const ShoppingCartHeader({Key? key}) : super(key: key);

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  int selected = 0;
  List<String> selectedPic = [
    'assets/p1.jpeg',
    'assets/p2.jpeg',
    'assets/p3.jpeg',
    'assets/p4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector()
      ],
    );
  }

  _buildHeaderPic(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selected],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, Icons.directions_bike),
          _buildHeaderSelectorButton(1, Icons.motorcycle),
          _buildHeaderSelectorButton(2, CupertinoIcons.car_detailed),
          _buildHeaderSelectorButton(3, CupertinoIcons.airplane),
        ],
      ),
    );
  }

  _buildHeaderSelectorButton(int id, IconData mIcon){
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selected ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black,),
        onPressed: () {
          setState(() {
            selected = id;
          });
        },
      ),
    );
  }

}
