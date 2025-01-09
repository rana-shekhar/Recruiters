import 'package:flutter/material.dart';
import 'package:recruiters/job_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recruiters/model/aspirant_data.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

class AspirantsDetails extends StatefulWidget {
  final JobData jobData;
  const AspirantsDetails({super.key, required this.jobData});

  @override
  State<AspirantsDetails> createState() => _AspirantsDetailsState();
}

class _AspirantsDetailsState extends State<AspirantsDetails> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aspirants Details"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: db
            .collection("applyNowDetails")
            .where('jobid', isEqualTo: widget.jobData.id)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Data Found"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final aspirant = AspirantData.fromMap(snapshot.data!.docs[index].data());
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(aspirant.name.toString()),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${aspirant.name}"),
                      Text("Email: ${aspirant.email}"),
                      Text("Phone: ${aspirant.phoneNumber}"),
                      InkWell(
                        onTap: () async {

                          final url = aspirant.resumePath;
                          print("Resume URL: $url");

                          if (url.isNotEmpty) {
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Cannot open the resume URL")),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("No resume uploaded")),
                            );
                          }
                        },
                        child: const Text(
                          "View Resume",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
