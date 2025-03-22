import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'controllers/container_controller.dart';

class containerExample extends StatefulWidget {
  containerExample({super.key});

  @override
  State<containerExample> createState() => _containerExampleState();

}

class _containerExampleState extends State<containerExample> {
  final Container_Controller logic = Get.put(Container_Controller());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container example"),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() {
              return Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(logic.opecity.value),
                ),
              );
            }),
            Gap(20),
            Obx(() {
              return Slider(
                  value: logic.opecity.value,
                  max: 1,
                  min: 0,
                  onChanged: (value) {
                    logic.opacityChange(value);
                  });
            }),
          ],
        ),
      ),

    );
  }
}


