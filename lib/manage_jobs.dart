import 'package:flutter/material.dart';
import 'package:recruiters/approve_job.dart';
import 'package:recruiters/edit_job.dart';
// import 'package:recruiters/job_data.dart';

import 'job_form.dart';

class ManageJobs extends StatelessWidget {
  const ManageJobs({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample job data
   

    return DefaultTabController(
      length: 2,
      
      child: Scaffold(
        
        appBar: AppBar(
          title: const Text('Manage Jobs'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.add,),
              text: 'add job',
            ),
            Tab(icon: Icon(Icons.assignment_turned_in),
            text: 'Approve jobs'
            )
          ]
          ),
          
        ),
        body:const  TabBarView(children: [
EditJob(),
ApproveJob(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JobForm()),
            );
          },
          child: const Icon(Icons.add),
        ),
        
       
      ),
    );
  }
}
