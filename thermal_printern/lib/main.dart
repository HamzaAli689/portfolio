import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final BlueThermalPrinter printer = BlueThermalPrinter.instance;

  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevice;

  @override
  void initState() {
    super.initState();
    _getDevices();
  }

  // Connected Devices Ko List Mein Lana
  Future<void> _getDevices() async {
    try {
      final List<BluetoothDevice> result = await printer.getBondedDevices();
      setState(() {
        devices = result;
        if (devices.isNotEmpty) {
          selectedDevice = devices.first;
        }
      });
    } catch (e) {
      print("Error getting devices: $e");
    }
  }

  // Arabic Text Encode Karne Ka Function
  Uint8List encodeArabic(String text) {
    List<int> encodedBytes = [];
    for (var char in text.split('')) {
      encodedBytes.add(char.codeUnitAt(0));
    }
    return Uint8List.fromList(encodedBytes);
  }

  // Arabic Text Ko Reverse Karne Ka Function
  String reverseArabic(String text) {
    return text.split('').reversed.join('');
  }

  // Print Function
  Future<void> _printReceipt(String arabicText) async {
    if (selectedDevice == null) {
      print("No device selected");
      return;
    }

    try {
      bool isConnected = await printer.isConnected ?? false;

      if (!isConnected) {
        await printer.connect(selectedDevice!);
      }

      String reversedText = reverseArabic(arabicText);

      printer.printCustom('فاتورة الشراء', 3, 1); // Arabic Title
      printer.printCustom('--------------------', 1, 1);
      printer.printCustom(reversedText, 1, 1);     // Arabic text
      printer.printNewLine();
      printer.paperCut();

      print("Printing Successful");
    } catch (e) {
      print("Printing Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController arabicTextController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Thermal Printer Arabic Test')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<BluetoothDevice>(
                value: selectedDevice,
                hint: Text('Select Printer'),
                items: devices.map((device) {
                  return DropdownMenuItem(
                    value: device,
                    child: Text(device.name ?? 'Unknown Device'),
                  );
                }).toList(),
                onChanged: (device) {
                  setState(() {
                    selectedDevice = device;
                  });
                },
              ),
              TextField(
                controller: arabicTextController,
                decoration: InputDecoration(labelText: 'Enter Arabic Text'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _printReceipt(arabicTextController.text),
                child: Text('Print Arabic Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
