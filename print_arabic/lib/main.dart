import 'package:flutter/material.dart';
import 'BluetoothScreen.dart';
import 'PrintScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thermal Printer App',
      home: BluetoothScreen(),
      routes: {
        '/print': (context) => PrintScreen(),
      },
    );
  }
}
