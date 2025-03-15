import 'package:flutter/material.dart';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _devices = [];

  @override
  void initState() {
    super.initState();
    _scanForDevices();
  }

  void _scanForDevices() {
    _printerManager.startScan(Duration(seconds: 4));
    _printerManager.scanResults.listen((devices) {
      setState(() {
        _devices = devices;
      });
    });
  }

  void _connectToDevice(PrinterBluetooth device) {
    _printerManager.selectPrinter(device);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connected to ${device.name}'))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bluetooth Devices')),
      body: ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_devices[index].name ?? ''),
            subtitle: Text(_devices[index].address ?? ''),
            onTap: () => _connectToDevice(_devices[index]),
          );
        },
      ),
    );
  }
}
