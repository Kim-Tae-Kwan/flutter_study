import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:modu_tour/page/favoritePage.dart';
import 'package:modu_tour/page/settingPage.dart';
import 'package:sqflite/sqflite.dart';

import 'mapPage.dart';

class MainPage extends StatefulWidget {
  final Future<Database> database;

  const MainPage({Key? key, required this.database}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  late final TabController controller;
  late FirebaseDatabase _database;
  late DatabaseReference reference;
  late String id;


  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    _database = FirebaseDatabase.instance;
    reference = _database.ref().child('tour');
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          MapPage(
            id: id,
            databaseReferencee: reference,
            db: widget.database,
          ),
          FavoritePage(),
          SettingPage()
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const [
          Tab(
            icon: Icon(Icons.map),
          ),
          Tab(
            icon: Icon(Icons.star),
          ),
          Tab(
            icon: Icon(Icons.settings),
          ),
        ],
        labelColor: Colors.amber,
        indicatorColor: Colors.deepOrangeAccent,
        controller: controller,
      ),
    );
  }
}
