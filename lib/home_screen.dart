import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:recruiters/job_data.dart';
import 'package:recruiters/screens/job_card.dart';

import 'job_form.dart';
import 'manage_jobs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job App'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ManageJobs()),
            ).then((value) {
              setState(() {});
            });
          },
        ),
      ),
      body: FutureBuilder(
          future: db.collection('job').where('isVerified',isEqualTo: true).where('isActive', isEqualTo: true).orderBy('jobTitle').get(),
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
                final job = JobData.fromMap(snapshot.data!.docs[index].data());
                return Card(
                  color: Colors.blue,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(job.jobTitle,
                        style: const TextStyle(color: Colors.white)),
                    subtitle: Text(
                      "Company Name: ${job.aboutCompany}\nSalary: ${job.salary}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobCard(jobData: job),
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JobForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
