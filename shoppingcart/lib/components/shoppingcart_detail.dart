import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart/contants.dart';

class ShoppingCartDetail extends StatelessWidget {
  const ShoppingCartDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailNameAndPrice(),
            _buildDetailRatingAndReview(),
            _buildDetailColorOptions(),
            _buildDetailButton(context)
          ],
        ),
      ),
    );
  }

  _buildDetailNameAndPrice(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Urban Soft AL 10.0',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '\$699',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  _buildDetailRatingAndReview(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: const [
          Icon(Icons.star, color: Colors.yellow,),
          Icon(Icons.star, color: Colors.yellow,),
          Icon(Icons.star, color: Colors.yellow,),
          Icon(Icons.star_border, color: Colors.yellow,),
          Icon(Icons.star_border, color: Colors.yellow,),
          Spacer(),
          Text('review '),
          Text('(26)', style: TextStyle(color: Colors.blue),)
        ],
      ),
    );
  }

  _buildDetailColorOptions(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Color Options'),
          SizedBox(height: 10,),
          Row(
            children: [
              _buildDetailIcon(Colors.black),
              _buildDetailIcon(Colors.green),
              _buildDetailIcon(Colors.orange),
              _buildDetailIcon(Colors.grey),
              _buildDetailIcon(Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  _buildDetailIcon(Color mColor){
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              shape: BoxShape.circle
            ),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: ClipOval(
              child: Container(
                color: mColor,
                width: 40,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildDetailButton(BuildContext context){
    return Align(
      child: TextButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('장바구니에 담으시겠습니까?'),
              actions: [
                CupertinoDialogAction(
                  child: Text('확인'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text('확인'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
        child: Text(
          'Add to Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
