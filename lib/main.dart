import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'mainscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("user");

class MyApp extends StatelessWidget {
  static const String idScreen = "mainScreen";
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi Demo',
      theme: ThemeData(
        fontFamily: 'Martian Mono',
        primaryColor: Colors.white,
      ),
      home: const HomePage(
        title: 'hi',
      ),
    );
  }
}
