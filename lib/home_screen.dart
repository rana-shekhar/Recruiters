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
    DataHelper dataHelper = DataHelper();
    final jobData = dataHelper.getApprovedJobs();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Job App'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ManageJobs()),
            );
          },
        ),
      ),
      body: jobData.isEmpty
          ? const Center(child: Text('No approved jobs available'))
          :ListView.builder(
        itemCount: jobData.length,
        itemBuilder: (context, index) {
          return Card(
            color:Colors.black,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(jobData[index].jobTitle),
              onTap: () {
                // Define
                setState(() {
                  
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
