import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recruiters/home_screen.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            "Welcome To Recruit Process",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
