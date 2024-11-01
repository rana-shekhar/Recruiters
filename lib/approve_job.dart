import 'package:flutter/material.dart';
import 'package:recruiters/demo.dart';

import 'data_helper.dart';

class ApproveJob extends StatelessWidget {
  const ApproveJob({super.key});

  @override
  Widget build(BuildContext context) {
    DataHelper dataHelper = DataHelper();

    final jobData = dataHelper.allData();
  
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
                      builder: (context) => Demo(jobData: jobData[index])));
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Handle job deletion
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Deleted: ${jobData[index].jobTitle}'), // Better message
                  ),
                );
              },
            ),
          ),
        );
      },
    ));
  }
}
