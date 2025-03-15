import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

class PrintScreen extends StatefulWidget {
  @override
  _PrintScreenState createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  final TextEditingController _englishController = TextEditingController();
  final TextEditingController _arabicController = TextEditingController();

  PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _devices = [];
  PrinterBluetooth? _selectedPrinter;

  @override
  void initState() {
    super.initState();
    _printerManager.startScan(Duration(seconds: 4));
    _printerManager.scanResults.listen((devices) {
      setState(() {
        _devices = devices;
      });
    });
  }

  Future<void> _printText() async {
    if (_selectedPrinter == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a printer first')),
      );
      return;
    }

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    List<int> bytes = [];

    // Add English Text
    bytes += generator.text(
      _englishController.text,
      styles: PosStyles(align: PosAlign.left),
    );

    // Add Arabic Text as Image
    final arabicText = _arabicController.text;
    final arabicImage = _textToImage(arabicText);
    bytes += generator.image(arabicImage);

    bytes += generator.feed(2);  // Line spacing
    bytes += generator.cut();    // Paper cut command

    _printerManager.selectPrinter(_selectedPrinter!);
    await _printerManager.printTicket(bytes);
  }

  img.Image _textToImage(String text) {
    final image = img.Image(300, 100); // Canvas size
    img.fill(image, img.getColor(255, 255, 255)); // White background
    img.drawString(image, img.arial_24, 10, 40, text); // Draw Arabic text
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Print Text')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<PrinterBluetooth>(
              value: _selectedPrinter,
              hint: Text('Select Printer'),
              onChanged: (PrinterBluetooth? printer) {
                setState(() {
                  _selectedPrinter = printer;
                  _printerManager.selectPrinter(printer!);
                });
              },
              items: _devices.map((device) {
                return DropdownMenuItem(
                  value: device,
                  child: Text(device.name ?? 'Unknown device'),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _englishController,
              decoration: InputDecoration(labelText: 'Enter English Text'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _arabicController,
              decoration: InputDecoration(labelText: 'Enter Arabic Text'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _printText,
              child: Text('Print Text'),
            ),
          ],
        ),
      ),
    );
  }
}
