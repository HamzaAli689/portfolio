
import 'package:flutter/material.dart';

class Faovratapp extends StatefulWidget {
  const Faovratapp({super.key});

  @override
  State<Faovratapp> createState() => _FaovratappState();
}

class _FaovratappState extends State<Faovratapp> {
  List<String> fruits = ["Apple", "Mango", "Banana", "Orange"];
  List<String> favorit = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorit App Example"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView.builder(
        itemCount: fruits.length,
          itemBuilder: (context, i){
        return Card(
          elevation: 4,
          child: ListTile(
            onTap: (){
              if(favorit.contains(fruits[i].toString())){
                favorit.remove(fruits[i].toString());
              }else{
                favorit.add(fruits[i].toString());

              }
              setState(() {

              });
            },
            title: Text(fruits[i].toString()),
            trailing: Icon(Icons.favorite,
              color: favorit.contains(fruits[i].toString()) ? Colors.red :Colors.grey,),
          ),
        );
      }),
    );
  }
}
