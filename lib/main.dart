import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ucs_mdy/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDe0tqQB2NcDeD6R8RLAS4Ne2j_8BA_n8k",
          authDomain: "ucs-mdy.firebaseapp.com",
          projectId: "ucs-mdy",
          storageBucket: "ucs-mdy.appspot.com",
          messagingSenderId: "120811151908",
          appId: "1:120811151908:web:5b2a38298bfb817b0daeb1",
          measurementId: "G-GRF8949XQC"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'UCS(MDY)',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
      ),
      home: const HomeScreen(),
      // routes: {
      //   '/': (context) => const TimetableScreen(),
      //   '/custom': (context) => const CustomizedTimetableScreen(),
      // },
    );
  }
}
