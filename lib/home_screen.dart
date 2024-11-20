import 'package:flutter/material.dart';

import 'package:recruiters/data_helper.dart';
import 'package:recruiters/screens/job_card.dart';

import 'job_form.dart';
import 'manage_jobs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: DataHelper.getDisplayJobs.isEmpty
          ? const Center(child: Text('No jobs available'))
          : ListView.builder(
              itemCount: DataHelper.getDisplayJobs.length,
              itemBuilder: (context, index) {
final job = DataHelper.getDisplayJobs.toList()[index];
                return Card(
                  color: Colors.blue,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(job.jobTitle, style: const TextStyle(color: Colors.white)),
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
  setState(() {
   
  });
});

                      
                    },
                  ),
                );
              },
            ),
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