import 'package:firebase/memoPage.dart';
import 'package:firebase/tabsPage.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorObservers: [observer],
      home: MemoPage()
    );
  }
}

class FirebaseApp extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const FirebaseApp({Key? key, required this.analytics, required this.observer})
      : super(key: key);

  @override
  State<FirebaseApp> createState() => _FirebaseAppState();
}

class _FirebaseAppState extends State<FirebaseApp> {
  String _message = '';

  void setMessage(String mes) {
    setState(() {
      _message = mes;
    });
  }

  _sendAnalyticsEvent() async {
    await widget.analytics.logEvent(
        name: 'test_event',
        parameters: {'string': 'hello  flutter', 'int': 100});
    setMessage('Analytics 보내기 성공');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _sendAnalyticsEvent,
              child: const Text(
                'test',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            ),
            Text(_message, style: const TextStyle(color: Colors.blueAccent),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<TabsPage>(
            settings: const RouteSettings(name: '/tab'),
            builder: (context) {
              return TabsPage(observer: widget.observer);
            },
          ));
        },
        child: const Icon(Icons.tab),
      ),
    );
  }
}
