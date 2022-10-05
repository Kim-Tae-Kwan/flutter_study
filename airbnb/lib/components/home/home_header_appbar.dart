import 'package:airbnb/constants.dart';
import 'package:airbnb/size.dart';
import 'package:airbnb/styles.dart';
import 'package:flutter/material.dart';

class HomeHeaderAppBar extends StatelessWidget {
  const HomeHeaderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: Row(
        children: [
          _buildAppBarLogo(),
          Spacer(),
          _buildAppBarMenu()
        ],
      ),
    );
  }

  _buildAppBarLogo(){
    return Row(
      children: [
        Image.asset('assets/logo.png', width: 30, height: 30, color: kAccentColor,),
        SizedBox(width: gap_s,),
        Text('RoomOfAll', style: h5(mColor: Colors.white),)
      ],
    );
  }

  _buildAppBarMenu() {
    return Row(
      children: [
        InkWell(
          child: Text('회원가입', style: subtitile1(mColor: Colors.white),),
          onTap: () {
            print('회원가입 클릭');
          },
        ),
        SizedBox(width: gap_m,),
        InkWell(
          child: Text('로그인', style: subtitile1(mColor: Colors.white),),
          onTap: () {
            print('로그인 클릭');
          },
        )
      ],
    );
  }
}
