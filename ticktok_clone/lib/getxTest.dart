import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final contoller = Get.put(StateController());
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Count'),
                  SizedBox(height: 10,),
                  Text(contoller.count.value.toString()),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          contoller.increment();
                        },
                        child: Icon(Icons.plus_one),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          contoller.decrement();
                        },
                        child: Icon(Icons.exposure_minus_1),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Get.off(() => const SecondPage());
                    },
                    child: Text('Next Page'),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Second'),
            ElevatedButton(
              onPressed: (){
                Get.back();
              },
              child: Text('Prev Page'),
            )
          ],
        ),
      ),
    );
  }
}





class StateController extends GetxController{
  late Rx<int> count;

  @override
  void onInit() {
    super.onInit();
    count = Rx<int>(1);
    ever(count, (_) => print(_));
    once(count, (_) => print("called once"));
    debounce(count, (_) => print("called after 1 second after last change"), time: Duration(seconds: 1));
    interval(count, (_) => print("called every second during the value is changed."), time: Duration(seconds: 1));
  }

  increment(){
    count.value++;
  }
  decrement(){
    count.value--;
  }
}