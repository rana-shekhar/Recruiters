import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:recruiters/data_helper.dart';
import 'package:recruiters/demo.dart';
import 'package:recruiters/job_data.dart';

class ApproveJob extends StatefulWidget {
  const ApproveJob({super.key});

  @override
  State<ApproveJob> createState() => _ApproveJobState();
}

class _ApproveJobState extends State<ApproveJob> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    // DataHelper dataHelper = DataHelper();

    // final jobData = dataHelper.getApprovedList();

    return Scaffold(
        body: FutureBuilder(
            future: db.collection("job").where('isVerified', isEqualTo: false).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData == false) {
                return const Text("No Data Found");
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final job =
                      JobData.fromMap(snapshot.data!.docs[index].data());
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(job.jobTitle),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Demo(jobData: job))).then(
                          (value) {
                            setState(() {});
                          },
                        );
                      },
                    ),
                  );
                },
              );
            }));
  }
}
