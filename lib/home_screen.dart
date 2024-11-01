import 'package:flutter/material.dart';
import 'job_form.dart';
import 'manage_jobs.dart'; 
// import 'manage_jobs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            );
          },
        ),
      ),
      body: const Center(
        child: Text('Welcome to Job App!', style: TextStyle(fontSize: 24)),
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
