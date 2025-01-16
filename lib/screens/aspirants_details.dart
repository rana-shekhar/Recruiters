import 'package:flutter/material.dart';
import 'package:recruiters/job_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recruiters/model/aspirant_data.dart';
import 'package:recruiters/screens/ResumeViewer.dart';



class AspirantsDetails extends StatefulWidget {
  final JobData jobData;
  const AspirantsDetails({super.key, required this.jobData});

  @override
  State<AspirantsDetails> createState() => _AspirantsDetailsState();
}

class _AspirantsDetailsState extends State<AspirantsDetails> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
final String testUrl = "https://firebasestorage.googleapis.com/v0/b/hdc-dev-9202b.appspot.com/o/Resume%2Finvoice.pdf?alt=media&token=dd56dc64-5ed8-4c31-be83-27d821383352";
  void _openPdfViewer(String testUrl) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewScreen(urlPdf: testUrl, title: 'Resume',),
          
      ),
    );
  }

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
                  title: Text(aspirant.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${aspirant.name}"),
                      Text("Email: ${aspirant.email}"),
                      Text("Phone: ${aspirant.phoneNumber}"),
                      InkWell(
                        onTap: () {
                          final testUrl = aspirant.resumePath;
                         print("Resume URL: $testUrl");

                          if (testUrl.isNotEmpty) {
                            _openPdfViewer(testUrl);
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