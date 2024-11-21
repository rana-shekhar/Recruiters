import 'package:flutter/material.dart';
import 'package:recruiters/splesh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpleshScreen(), 
    );
  }
}
