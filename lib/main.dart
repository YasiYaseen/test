import 'package:cusat_conf/count.dart';
import 'package:cusat_conf/post.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> main() async {
  Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Cusat'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
          ),
          Lottie.asset('lottie/letter.json',
              height: size.height * .4, repeat: true, reverse: true),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ConfessionPage(),
                  ),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text('Post Confession'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent, // Set transparent background
                onPrimary: Colors.indigo, // Text color when not pressed
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // Increase size here
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    color: Colors.indigo, // Outline color
                  ),
                ),
                elevation: 5, // Add elevation for shadow effect
              ),
            ),
          ),
          SizedBox(height: size.height * .3),
          CounterCardWidget(confessionCount: 12)
        ],
      ),
    );
  }
}
