import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:virtual_device_test/Screen_One.dart';

class Testfile extends StatelessWidget {
  const Testfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("GetX Solutions"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text("Massage".tr),
              subtitle: Text("Name".tr),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Get.updateLocale(Locale("en","US"));
                }, child: Text("English")),
                Gap(20),
                ElevatedButton(onPressed: (){
                  Get.updateLocale(Locale("ur","PK"));
                }, child: Text("Urdu")),
              ]
            )
            // ElevatedButton(
            //     onPressed: () {
            //       Get.to(() => ScreenOne());
            //     },
            //     child: Text("Go to Screen One")),
          ],
        ),
      ),
    );
  }
}
// Column(
// children: [
// SizedBox(height: 20,),
// Card(
// child: ListTile(
// title: Text("GetX Alert Dialog"),
// subtitle: Text("GetX Alert Dialog show the dialog"),
// onTap: (){
// Get.defaultDialog(
// title: "Delete the chat",
// middleText: " Are you Sure you want to delete your chat?",
// confirm: TextButton(onPressed: () { Get.back(); }, child: Text("Ok"),),
// cancel : TextButton(onPressed: () { Get.back(); }, child: Text("Cancel"),)
// );
// },
// ),
// ),
// SizedBox(height: 20,),
// Card(
// child: ListTile(
// title: Text("GetX BottomSheet"),
// subtitle: Text("GetX BottomSheet show the BottomSheet"),
// onTap: (){
// Get.bottomSheet(
// Container(
// color: Colors.red,
// child: Column(
// children: [
// ListTile(
// leading: Icon(Icons.light_mode),
// title: Text("Light Theme"),
// onTap: (){
// Get.changeTheme(ThemeData.light());
// },
// ),
// ListTile(
// onTap: (){
// Get.changeTheme(ThemeData.dark());
// },
// leading: Icon(Icons.dark_mode),
// title: Text("Dark Theme"),
// ),
//
// ],
// ),
// ));
// },
// ),
// ),
// ],
// ),
