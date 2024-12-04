import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recruiters/model/aspirant_data.dart'; // Ensure you import this if using FirebaseFirestore

class AspirantsDetails extends StatefulWidget {
  const AspirantsDetails({super.key});

  @override
  State<AspirantsDetails> createState() => _AspirantsDetailsState();
}

class _AspirantsDetailsState extends State<AspirantsDetails> {
  final FirebaseFirestore db =
      FirebaseFirestore.instance; // Initialize FirebaseFirestore

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: db.collection("job").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (!snapshot.hasData || snapshot.data == null) {
            // Fix for checking no data
            return const Text("No Data Found");
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final aspirant =
                  AspirantData.fromMap(snapshot.data!.docs[index].data());
              return ListTile(
                title: Text(aspirant.name.toString()),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email: ${aspirant.email}"),
                    Text("Phone: ${aspirant.phoneNumber}"),
                    if (aspirant.resumePath.isNotEmpty)
                      Text("Resume: ${aspirant.resumePath.split('/').last}"),
                  ],
                ),
                isThreeLine: true,
              );
            },
          );
        },
      ),
    );
  }
}
