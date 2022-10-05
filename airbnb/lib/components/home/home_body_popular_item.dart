import 'package:airbnb/constants.dart';
import 'package:airbnb/size.dart';
import 'package:airbnb/styles.dart';
import 'package:flutter/material.dart';

class HomeBodyPopularItem extends StatelessWidget {
  final id;
  final popularList = [
    'p1.jpeg',
    'p2.jpeg',
    'p3.jpeg',
  ];

  HomeBodyPopularItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double popularItemWidth = getBodyWidth(context) / 3 - 5;

    return Padding(
      padding: const EdgeInsets.only(bottom: gap_xl),
      child: Container(
        constraints: BoxConstraints(minWidth: 320),
        child: SizedBox(
          width: popularItemWidth,
          child: Column(
            children: [
              _buildPopularItemImage(),
              _buildPopularItemStar(),
              _buildPopularItemComment(),
              InkWell(child: _buildPopularItemUserInfo(), onTap: (){print('kim');},)

            ],
          ),
        ),
      ),
    );
  }

  _buildPopularItemImage(){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/${popularList[id]}',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: gap_s,)
      ]
    );
  }

  _buildPopularItemStar(){
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.star, color: kAccentColor,),
            Icon(Icons.star, color: kAccentColor,),
            Icon(Icons.star, color: kAccentColor,),
            Icon(Icons.star, color: kAccentColor,),
            Icon(Icons.star, color: kAccentColor,),
          ],
        ),
        SizedBox(height: gap_s,)
      ],
    );
  }

  _buildPopularItemComment(){
    return Column(
      children: [
        Text(
            '깔끔하고 다 같춰져있어서 좋았어요:) 위치도 완전 종하용 다들 여기 살고싶다구 ㅋㅋㅋㅋㅋㅋㅋ 화장실도 3개예요!! 5명이서 씻는것도 전혀 불편함없이 좋았어요 ^^ 이불도 포근하고 좋습니당 ㅎㅎ'
        ),
        SizedBox(height: gap_s,)
      ],
    );
  }

  _buildPopularItemUserInfo(){
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/p1.jpeg'),
        ),
        SizedBox(width: gap_s,),
        Column(
          children: [
            Text(
              '데어',
              style: subtitile1(),
            ),
            Text('한국')
          ],
        )
      ],
    );
  }
}
