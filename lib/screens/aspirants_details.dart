import 'package:flutter/material.dart';
import 'package:recruiters/job_data.dart';

// import '../data_helper.dart';

class AspirantsDetails extends StatefulWidget {
  final JobData jobData;
  const AspirantsDetails({super.key, required this.jobData});

  @override
  State<AspirantsDetails> createState() => _AspirantsDetailsState();
}

class _AspirantsDetailsState extends State<AspirantsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: widget.jobData.aspirantList.isEmpty
          ? const Center(
              child: Text(
                'No Aspirants Available',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.jobData.aspirantList.length,
              itemBuilder: (context, index) {
                final aspirant = widget.jobData.aspirantList[index];
                return ListTile(
                  title: Text(aspirant.name.toString()), 
                  subtitle: Text(aspirant.email.toString()), 
                );
              },
            ),
    );
  }
}
