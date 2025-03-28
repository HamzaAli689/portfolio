
import 'package:flutter/material.dart';

class Faovratapp extends StatefulWidget {
  const Faovratapp({super.key});

  @override
  State<Faovratapp> createState() => _FaovratappState();
}

class _FaovratappState extends State<Faovratapp> {
  List<String> fruits = ["Apple", "Mango", "Banana", "Orange"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorit App Example"),
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, i){
        return Card(
          child: ListTile(
            title: Text("Item $i"),
          ),
        );
      }),
    );
  }
}
