import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  final FirebaseAnalyticsObserver observer;

  const TabsPage({Key? key, required this.observer}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin, RouteAware {
  TabController? _controller;
  int selectedIndex = 0;

  final List<Tab> tabs = [
    const Tab(
      text: '1',
      icon: Icon(Icons.looks_one),
    ),
    const Tab(
      text: '2',
      icon: Icon(Icons.looks_two),
    ),
  ];


  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: tabs.length,
      initialIndex: selectedIndex
    );
    _controller?.addListener(() {
      setState(() {
        if(selectedIndex != _controller!.index){
          selectedIndex = _controller!.index;
          _sendCurrentTab();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: tabs.map((Tab tab) {
          return Center(child: Text(tab.text!),);
        }).toList(),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.observer.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    widget.observer.unsubscribe(this);
    super.dispose();
  }

  _sendCurrentTab(){
    widget.observer.analytics.setCurrentScreen(screenName: 'tab/$selectedIndex');
  }
}
