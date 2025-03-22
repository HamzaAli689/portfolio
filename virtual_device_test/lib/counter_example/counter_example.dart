import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final Counter_Controller logic = Get.put(Counter_Controller());

  @override
  Widget build(BuildContext context) {
    print("rebulid");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("StateManagement"),
      ),
      body: Center(
          child:
          Obx(() {
            return Text(logic.counter.toString(), style: TextStyle(
              fontSize: 50,
            ),);
          })

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

          logic.incrementCounter();
          print("the vale of counter is ${logic.counter}");

      }),
    );
  }
}
