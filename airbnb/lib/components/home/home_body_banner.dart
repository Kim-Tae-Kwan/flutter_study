import 'package:airbnb/size.dart';
import 'package:airbnb/styles.dart';
import 'package:flutter/material.dart';

class HomeBodyBanner extends StatelessWidget {
  const HomeBodyBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Stack(
        children: [
          _buildBannerImage(),
          _buildBannerCaption()
        ],
      ),
    );
  }

  _buildBannerImage(){
    return ClipRRect( // 이미지 모서리 둥굴게
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/banner.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 320,
      ),
    );
  }

  _buildBannerCaption(){
    return Positioned(
      top: 40,
      left: 40,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 150,
            ),
            child: Text(
              '이제, 여행은 가까운 곳에서',
              style: h4(mColor: Colors.white),
            ),
          ),
          SizedBox(height: gap_m,),
          Container(
            constraints: BoxConstraints(
              maxWidth: 150,
            ),
            child: Text(
              "새로운 공간에 머물러 보세요. 살아보기, 출장, 여행 등 다양한 복적에 맞는 숙소를 찾아보세요.",
              style: subtitile1(mColor: Colors.white),
            ),
          ),
          SizedBox(height: gap_m,),
          SizedBox(
            height: 35,
            width: 170,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )
              ),
              onPressed: () {},
              child: Text(
                "가까운 여행지 둘러보기",
                style: subtitle2(),
              ),
            ),
          )
        ],
      ),
    );
  }

}
