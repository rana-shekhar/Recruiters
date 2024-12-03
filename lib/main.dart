import 'package:flutter/material.dart';
import 'package:recruiters/splesh_screen.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the generated firebase_options.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Pass platform-specific options
  );
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
