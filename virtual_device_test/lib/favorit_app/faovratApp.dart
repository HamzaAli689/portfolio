
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'faovratApp.controller.dart';

class Faovratapp extends StatefulWidget {
  const Faovratapp({super.key});

  @override
  State<Faovratapp> createState() => _FaovratappState();
}

class _FaovratappState extends State<Faovratapp> {

  FaovratController logic = Get.put(FaovratController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorit App Example"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView.builder(
        itemCount: logic.fruits.length,
          itemBuilder: (context, i){
        return Card(
          elevation: 4,
          child: ListTile(
            onTap: (){
              if(logic.favorit.contains(logic.fruits[i].toString())){
                logic.favorit.remove(logic.fruits[i].toString());
              }else{
                logic.favorit.add(logic.fruits[i].toString());

              }
              setState(() {

              });
            },
            title: Text(logic.fruits[i].toString()),
            trailing: Icon(Icons.favorite,
              color: logic.favorit.contains(logic.fruits[i].toString()) ? Colors.red :Colors.grey,),
          ),
        );
      }),
    );
  }
}
