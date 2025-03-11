import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_device_test/Screen_Two.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key,});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Screen One" ),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to( () => ScreenTwo());
            }, child: Text("Go to Screen Two")),
          ],
        ),
      ),
    );
  }
}
