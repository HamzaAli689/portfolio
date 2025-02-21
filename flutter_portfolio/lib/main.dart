import 'package:flutter/material.dart';
import 'package:flutter_portfolio/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApplicationsScreen(),
    );
  }
}

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> projects = const [
    {"image": "assets/quizapp.jpg", "alt": "Project 1"},
    {"image": "assets/profileApp.jpg", "alt": "Project 2"},
    {"image": "assets/bmi.jpg", "alt": "Project 3"},
    {"image": "assets/smarteducation.png", "alt": "Project 4"},
    {"image": "assets/loginScreens.png", "alt": "Project 5"},
    {"image": "assets/quizapp.jpg", "alt": "Project 6"},
    {"image": "assets/profileApp.jpg", "alt": "Project 7"},
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          "My Portfolio",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Container(
              height: size.height * .30,
              width: size.width * .35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipOval(child: Image.asset("assets/profilepic1.jpg",fit: BoxFit.cover,)),
            ),
            Text("Hamza Ali",style: TextStyle(
              fontSize: 30,
              color: secondary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "A Passionate Flutter Developer from Pakistan",
                style: TextStyle(fontSize: 16, color: primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About Me",style: TextStyle(
                    fontSize: 24,
                    color: secondary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),),
                  Text(
                    "I am a passionate Flutter developer with experience in building cross-platform mobile and web applications. My expertise includes creating interactive user interfaces and working with Firebase for authentication, Firestore, and cloud storage solutions. I have developed a range of applications, Chat App using Firebase, from utility tools like a BMI Calculator to entertainment apps like a Xylophone and Quiz app. With a focus on clean, responsive design, I can create custom solutions for both Android and web platforms. Currently, I am deepening my knowledge of Firebase's advanced features and looking to contribute to innovative projects that challenge my skills.",
                    style: TextStyle(fontSize: 16, color: primary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns on larger screens
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 300 / 210, // Match the aspect ratio
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return GalleryItem(
                    imagePath: projects[index]["image"]!,
                    altText: projects[index]["alt"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryItem extends StatelessWidget {
  final String imagePath;
  final String altText;

  const GalleryItem({
    Key? key,
    required this.imagePath,
    required this.altText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // Ensures the image fits the container
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Add functionality for onTap if required
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // Dark background
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/playstore-logo.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 20), // Spacing between icons
                            Image.asset(
                              'assets/applestore-logo.png',
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
