import 'package:flutter/material.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thermal Printer App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevice;

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() async {
    bluetoothPrint.startScan(timeout: const Duration(seconds: 4));

    bluetoothPrint.scanResults.listen((result) {
      setState(() => devices = result);
    });
  }

  Future<void> _connectPrinter(BluetoothDevice device) async {
    await bluetoothPrint.connect(device);
    setState(() => selectedDevice = device);
  }

  Future<void> _printArabicText() async {
    if (selectedDevice == null) return;

    Map<String, dynamic> config = {};
    List<LineText> list = [];

    list.add(LineText(
      type: LineText.TYPE_TEXT,
      content: 'مرحبا بك في مطعمنا',
      align: LineText.ALIGN_CENTER,
      linefeed: 1,
    ));

    await bluetoothPrint.printReceipt(config, list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thermal Printer App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(devices[index].name ?? 'Unknown Device'),
                  subtitle: Text(devices[index].address ?? ''),
                  onTap: () => _connectPrinter(devices[index]),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _printArabicText,
              child: const Text('Print Arabic Text'),
            ),
          ],
        ),
      ),
    );
  }
}
