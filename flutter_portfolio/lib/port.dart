import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.dark,
//       darkTheme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.black,
//       ),
//       home: PortfolioScreen(),
//     );
//   }
// }

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          '<Hamza Ali/>',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          _navItem('Home'),
          _navItem('Skills'),
          _navItem('Education'),
          _navItem('Achievements'),
          _navItem('Contact'),
          Gap(20),
          IconButton(
            icon: Icon(Icons.dark_mode, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi! I\'m Hamza Ali',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You could call me an Android, Flutter Mobile app developer.',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: _socialIcons(),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        _customButton('CONTACT ME'),
                        SizedBox(width: 20),
                        _customButton('SEE MY RESUME'),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/img2.png', // Replace with real illustration URL
                      height: 350,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _navItem(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  List<Widget> _socialIcons() {
    List<IconData> icons = [
      Icons.facebook, Icons.twelve_mp, Icons.link, Icons.web, Icons.code,
    ];
    return icons
        .map((icon) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(icon, color: Colors.white, size: 30),
    ))
        .toList();
  }

  Widget _customButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,shape: RoundedRectangleBorder(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
