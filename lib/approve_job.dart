import 'package:flutter/material.dart';
import 'package:recruiters/demo.dart';

import 'data_helper.dart';

class ApproveJob extends StatefulWidget {
  const ApproveJob({super.key});

  @override
  State<ApproveJob> createState() => _ApproveJobState();
}

class _ApproveJobState extends State<ApproveJob> {
  @override
  Widget build(BuildContext context) {
    DataHelper dataHelper = DataHelper();

    final jobData = dataHelper.getApprovedList();

    return Scaffold(
        body: ListView.builder(
      itemCount: jobData.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(jobData[index].jobTitle),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Demo(jobData: jobData[index]))).then((value) {
                        setState(() {
                          
                        });
                      },
                        
                      );
             
            },
          ),
        );
      },
    ));
  }
}
