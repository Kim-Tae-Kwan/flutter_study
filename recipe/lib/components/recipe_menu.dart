import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          _buildMeunItem(Icons.food_bank, "ALL"),
          SizedBox(width: 25,),
          _buildMeunItem(Icons.emoji_food_beverage, "Coffee"),
          SizedBox(width: 25,),
          _buildMeunItem(Icons.fastfood, "Burger"),
          SizedBox(width: 25,),
          _buildMeunItem(Icons.local_pizza, "Pizza"),
        ],
      ),
    );
  }

  Widget _buildMeunItem(IconData icon, String subject) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.redAccent, size: 30,),
          SizedBox(height: 5,),
          Text(
            subject,
            style: TextStyle(color: Colors.black87),
          )
        ],
      ),
    );
  }
}
