import 'package:flutter/material.dart';
import 'package:recruiters/job_data.dart';

class Demo extends StatefulWidget {
 final  JobData jobData;
  const Demo({super.key, required this.jobData});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Text(widget.jobData.jobTitle),
    );
  }
}
