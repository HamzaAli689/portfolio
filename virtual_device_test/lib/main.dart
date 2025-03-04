import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Hamza Ali"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Show Date",
            ),
            ElevatedButton(onPressed: () async{
              DateTime? pickDate = await showDatePicker(context: context,initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2026),
              );

              if(pickDate != null){
                print("this ois slected date: ${pickDate.year} - ${pickDate.month} - ${pickDate.day}");}
              print(pickDate);
            }, child: Text("Select Date")),
            ElevatedButton(onPressed: () async{
              TimeOfDay? pickTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              print("this is my slected time: ${pickTime?.hour} - ${pickTime?.minute}");
            }, child: Text("Select Time")),
          ],
        ),
      ),
    );
  }
}
