import 'package:flutter/material.dart';

import 'package:recruiters/data_helper.dart';

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
    // DataHelper.getDisplayJobs.add(JobData(
    //     jobTitle: "jobTitle",
    //     jobType: "Temporary",
    //     jobModel: "Work From Home",
    //     salary: "20k",
    //     applicationDeadline: DateTime.now(),
    //     roleDescription: "nothing",
    //     qualification: "sss",
    //     experience: "Fresher",
    //     education: "Graduate",
    //     skillRequirement: "skillRequirement",
    //     aboutCompany: "aboutCompany",
    //     country: "country",
    //     state: "state",
    //     city: "city",
    //     pincode: "pindcoe",
    //     companyAddress: "companyAddress"));
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
                          setState(() {
                            
                          });
                        },);
          },
        ),
      ),
      body: DataHelper.getDisplayJobs.isEmpty
          ? const Center(child: Text('No jobs available'))
          : ListView.builder(
              itemCount: DataHelper.getDisplayJobs.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(DataHelper.getDisplayJobs[index].jobTitle),
                    onTap: () {
                      // Define
                      setState(() {});
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
