import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int x = 20;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("StateManagement"),
      ),
      body: Center(
        child: Text("0",style: TextStyle(
          fontSize: 50,
        ),),
      ),
    );
  }
}
