import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:modu_tour/model/listData.dart';
import 'package:modu_tour/model/tour.dart';
import 'package:modu_tour/page/tourDetailPage.dart';
import 'package:sqflite/sqflite.dart';

class MapPage extends StatefulWidget {

  final DatabaseReference databaseReferencee;
  final Future<Database> db;
  final String id;

  const MapPage({Key? key, required this.databaseReferencee, required this.db, required this.id}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<DropdownMenuItem> list = [];
  List<DropdownMenuItem> subList = [];
  List<Tour> tours = [];
  late ScrollController _scrollController;

  String authkey =
      '2397AZ16W0CRNwX58btT5QMtQ9gDRjo8TvCgF0Uj7QaSolpegysBotc5pVZg7HKyDBSK%2B%2BcabU%2FiMz5HfJmXVg%3D%3D';

  late Item area;
  late Item kind;
  int page = 1;

  @override
  void initState() {
    super.initState();
    list = Area().seoulArea;
    subList = Kind().kinds;

    area = list[0].value;
    kind = subList[0].value;

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        page++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('검색하기'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    items: list,
                    onChanged: (value) {
                      Item selectedItem = value;
                      setState(() {
                        area = selectedItem;
                      });
                    },
                    value: area,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    items: subList,
                    onChanged: (value) {
                      Item selectedItem = value;
                      setState(() {
                        kind = selectedItem;
                      });
                    },
                    value: kind,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      page = 1;
                      tours.clear();
                      getAreaList(
                          area: area.value,
                          contentTypeId: kind.value,
                          page: page);
                    },
                    child: const Text(
                      '검색하기',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        child: Row(
                          children: [
                            Hero(
                              tag: 'tourinfo$index',
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: tours[index].imagePath!.isNotEmpty
                                          ? NetworkImage(
                                              tours[index].imagePath!)
                                          : const AssetImage(
                                                  'assets/default.jpg')
                                              as ImageProvider,
                                      // image: NetworkImage(tours[index].imagePath)
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    tours[index].title!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('주소 : ${tours[index].address}'),
                                  tours[index].tel != null
                                      ? Text('전화번호 : ${tours[index].tel}')
                                      : Container()
                                ],
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TourDetailPage(
                              id: widget.id,
                              tourData: tours[index],
                              index: index,
                              databaseReference: widget.databaseReferencee,
                            ),
                          ));
                        },
                      ),
                    );
                  },
                  itemCount: tours.length,
                  controller: _scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAreaList(
      {required int area,
      required int contentTypeId,
      required int page}) async {
    var url = 'http://apis.data.go.kr/B551011/KorService/areaBasedList'
        '?serviceKey=${authkey}&MobileOS=AND&MobileApp=ModuTour&_type=json'
        '&areaCode=1&sigunguCode=$area&pageNo=$page';

    if (contentTypeId != 0) {
      url = url + '&contentTypeId=$contentTypeId';
    }

    var response = await http.get(Uri.parse(url));
    String body = utf8.decode(response.bodyBytes);
    print(body);
    var json = jsonDecode(body);
    if (json['response']['header']['resultCode'] == '0000') {
      if (json['response']['body']['items'] == '') {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('마지막 데이터 입니다.'),
            );
          },
        );
      } else {
        List jsonArray = json['response']['body']['items']['item'];
        for (var s in jsonArray) {
          setState(() {
            tours.add(Tour.fromJson(s));
          });
        }
      }
    } else {
      print('error');
    }
  }
}
