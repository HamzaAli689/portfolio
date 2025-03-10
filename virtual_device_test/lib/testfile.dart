import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Testfile extends StatelessWidget {
  const Testfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("GetX Solutions"),
      ),
      body:  Column(
        children: [
          SizedBox(height: 20,),
          Card(
            child: ListTile(
              title: Text("GetX Alert Dialog"),
              subtitle: Text("GetX Alert Dialog show the dialog"),
              onTap: (){
                Get.defaultDialog(
                  title: "Delete the chat",
                  middleText: " Are you Sure you want to delete your chat?",
                  confirm: TextButton(onPressed: () { Get.back(); }, child: Text("Ok"),),
                   cancel : TextButton(onPressed: () { Get.back(); }, child: Text("Cancel"),)
                );
              },
            ),
          ),
          SizedBox(height: 20,),
          Card(
            child: ListTile(
              title: Text("GetX BottomSheet"),
              subtitle: Text("GetX BottomSheet show the BottomSheet"),
              onTap: (){
                Get.bottomSheet(
                    Container(
                      color: Colors.red,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.light_mode),
                        title: Text("Light Theme"),
                        onTap: (){
                          Get.changeTheme(ThemeData.light());
                        },
                      ),
                      ListTile(
                        onTap: (){
                          Get.changeTheme(ThemeData.dark());
                        },
                        leading: Icon(Icons.dark_mode),
                        title: Text("Dark Theme"),
                      ),
                      
                    ],
                  ),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
