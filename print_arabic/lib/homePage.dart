import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:print_arabic/printPage.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      "title": "Apple",
      "price": 100,
      "Qty": 2,
    },
    {
      "title": "Juice",
      "price": 150,
      "Qty": 1,
    },
    {
      "title": "Banana",
      "price": 200,
      "Qty": 12,
    },
    {
      "title": "Mango",
      "price": 300,
      "Qty": 5,
    },
    {
      "title": "Fruite",
      "price": 50,
      "Qty": 10,
    },
  ];
  final f = NumberFormat("\$###,###.00", "en_US");

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    int total = 0;
    total = data
        .map((e) => e["price"] * e["Qty"])
        .reduce((value, element) => value + element);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter - Thermal Printer"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      data[index]["title"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                        f.format(data[index]["price"] * data[index]["Qty"])),
                    trailing: Text(
                        f.format(data[index]["price"] * data[index]["Qty"])),
                  );
                }),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Total: ${f.format(total)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Printpage(data: data)
                        ));
                    },
                    label: Text("Print"),
                    icon: Icon(Icons.print,color: Colors.white,),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
