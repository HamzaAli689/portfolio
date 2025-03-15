

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Printpage extends StatefulWidget {
  final List<Map<String, dynamic>> data;
   Printpage({super.key,required this.data});

  @override
  State<Printpage> createState() => _PrintpageState();
}

class _PrintpageState extends State<Printpage> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String deviesMsg = "";
  final f = NumberFormat("\$###,###.00", "en_US");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){});
  }
  Future<void> initPrint ()async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    if(!mounted) return;
    bluetoothPrint.scanResults.listen((val){
      if(!mounted) return;
      setState(() {
        _devices = val;
      });
      if(_devices.isEmpty){
        setState(() {
          deviesMsg = "No Devices Found";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Printer"),
        backgroundColor: Colors.redAccent,
      ),
      body: _devices.isEmpty ? Center(child: Text(deviesMsg ?? ""),):
          ListView.builder(
            itemCount: _devices.length,
              itemBuilder: (context,index){
            return ListTile(
              leading: Icon(Icons.print),
              title: Text(_devices[index].name ?? "No Name"),
              subtitle: Text(_devices[index].address ?? "No Address"),
              onTap: (){},
            );
          })
    );
  }
}
