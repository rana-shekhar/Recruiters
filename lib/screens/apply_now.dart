// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:recruiters/data_helper.dart';
import 'package:recruiters/job_data.dart';
import 'package:recruiters/model/aspirant_data.dart';

class ApplyNow extends StatefulWidget {
  final JobData jobdata;
  const ApplyNow({super.key, required this.jobdata});

  @override
  State<ApplyNow> createState() => _ApplyNowState();
}

class _ApplyNowState extends State<ApplyNow> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _coverLetterController = TextEditingController();
  String? resumePath;

  void resetForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _coverLetterController.clear();
    setState(() {
      resumePath = null;
    });
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application Form"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return "Please enter a valid 10-digit phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Open file picker to select a file
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: [
                        'pdf',
                        'doc',
                        'docx'
                      ], // Allow resume formats
                    );

                    if (result != null && result.files.single.path != null) {
                      setState(() {
                        resumePath = result.files.single.path;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "Resume selected: ${result.files.single.name}")),
                      );
                    } else {
                      // User canceled file selection
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("No file selected")),
                      );
                    }
                  } catch (e) {
                    // Handle any errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Failed to pick file: $e")),
                    );
                  }
                },
                child: Text(resumePath == null
                    ? "Upload Resume"
                    : "Resume Uploaded: ${resumePath!.split('/').last}"),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _coverLetterController,
                decoration: const InputDecoration(
                  labelText: "Cover Letter",
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a cover letter";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final db = FirebaseFirestore.instance;
                    final email = _emailController.text;
                    final jobType = widget.jobdata.jobType;

                    // Check if the user has already applied for this job
                    final existingDocs = await db
                        .collection('applyNowDetails')
                        .where('email', isEqualTo: email)
                        .where('jobType', isEqualTo: jobType)
                        .get();

                    if (existingDocs.size > 0) {
                      // User has already applied for this job
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("You have already applied for this job!")),
                      );
                    } else {
                      // Proceed to save data
                      final applyDetails = AspirantData(
                        name: _nameController.text,
                        email: email,
                        phoneNumber: _phoneController.text,
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                      );

                      await db
                          .collection("applyNowDetails")
                          .doc(applyDetails.id)
                          .set(
                      applyDetails.toMap(),
                 
                      );

                  
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Form Submitted Successfully")),
                      );

                    

                      resetForm();
                    }
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
