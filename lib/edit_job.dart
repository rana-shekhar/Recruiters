import 'package:flutter/material.dart';
import 'package:recruiters/add_jobs.dart';
import 'package:recruiters/data_helper.dart';

class EditJob extends StatefulWidget {
  const EditJob({super.key});

  @override
  State<EditJob> createState() => _EditJobState();
}

class _EditJobState extends State<EditJob> {
  @override
  Widget build(BuildContext context) {
    DataHelper dataHelper = DataHelper();
    final jobData = dataHelper.getApprovedJobs();

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
                      builder: (context) =>
                          AddJobs(jobData: jobData[index]))).then(
                (value) {
                  setState(() {});
                },
              );
            },
          ),
        );
      },
    ));
  }
}
