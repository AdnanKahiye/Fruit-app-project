import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/views/chart_page.dart';
import 'package:fruit_app/views/detail_page.dart';
import 'package:fruit_app/views/home_page.dart';
import 'package:fruit_app/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase with options for web
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAaivXLwU1Cp7c8S-7xHOZFbImDh2TmtjI", // Web API Key
        authDomain: "projects-e02a4.firebaseapp.com",
        projectId: "projects-e02a4",
        storageBucket: "projects-e02a4.appspot.com",
        messagingSenderId: "542969722665",
        appId: "1:542969722665:web:b009c136ecae220993a938",
      ),
    );
    // print("Firebase initialized successfully.");
  } catch (e) {
    // Catch and log any errors during Firebase initialization
    //print("Error initializing Firebase: $e");
  }

  // Run the app
  runApp(
    ProviderScope(
      // Wrap the app with ProviderScope
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
