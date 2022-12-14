import 'package:flutter/material.dart';

class Item {
  String title;
  int value;

  Item(this.title, this.value);
}

class Area{
  List<DropdownMenuItem> seoulArea = [];

  Area(){
    seoulArea.add(DropdownMenuItem(
      child: Text('강남구'),
      value: Item('강남구', 1),
    ));
  }
}

class Kind {
  List<DropdownMenuItem> kinds = [];

  Kind(){
    kinds.add(DropdownMenuItem(
      child: Text('관광지'),
      value: Item('관광지', 12),
    ));
  }
}