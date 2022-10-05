import 'package:flutter/material.dart';
import 'components/buttons.dart';
import 'components/count_info.dart';
import 'components/drawer.dart';
import 'components/header.dart';
import 'components/tab.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ProfileDrawer(),
      appBar: _buildProfileAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20,),
          ProfileHeader(),
          SizedBox(height: 20,),
          ProfileCountInfo(),
          SizedBox(height: 20,),
          ProfileButtons(),
          Expanded(child: ProfileTab()),
        ],
      ),
    );
  }

  AppBar _buildProfileAppBar() {
    return AppBar(
      leading: InkWell(
        onTap: () {
          print('뒤로가기');
        },
        child: const Icon(Icons.arrow_back_ios)
      ),
      title: const Text('Profile'),
      centerTitle: true,
    );
  }
}

