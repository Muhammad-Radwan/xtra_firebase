// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:xtra_firebase/Pages/login_page.dart';
import 'package:xtra_firebase/Pages/settings_page.dart';

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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 34, 169, 191)),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
