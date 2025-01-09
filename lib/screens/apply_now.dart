import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recruiters/job_data.dart';
import 'package:recruiters/model/aspirant_data.dart';
import 'package:recruiters/utiles_res.dart';

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

  File? resumeFile;
  bool isSubmitting = false;

  Future<void> pickResume() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        setState(() {
          resumeFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking file: $e")),
      );
    }
  }

  void resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _coverLetterController.clear();
    setState(() {
      resumeFile = null;
    });
  }

  Future<void> submitForm() async {
    if (!_formKey.currentState!.validate() || resumeFile == null) {
      if (resumeFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please upload a resume")),
        );
      }
      return;
    }

    setState(() {
      isSubmitting = true;
    });

    try {
      final db = FirebaseFirestore.instance;
      final email = _emailController.text;

      // Check if the user has already applied for this job
      final existingDocs = await db
          .collection('applyNowDetails')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (existingDocs.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You have already applied for this job!")),
        );
        return;
      }

      // Upload Resume
      Utilesres utilesres = Utilesres();
      final resumeUrl = await utilesres.uploadResume(
        resumeFile!.path,
        resumeFile!.path.split('/').last,
      );

      // Save Data
      final applyDetails = AspirantData(
        name: _nameController.text,
        email: email,
        phoneNumber: _phoneController.text,
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        jobId: widget.jobdata.id,
        resumePath: resumeUrl,
      );

      await db.collection("applyNowDetails").doc(applyDetails.id).set(applyDetails.toMap());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form Submitted Successfully")),
      );
      resetForm();
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error submitting form: $e")),
      );
    } finally {
      setState(() {
        isSubmitting = false;
      });
    }
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
                validator: (value) => value == null || value.isEmpty
                    ? "Please enter your name"
                    : null,
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
                onPressed: isSubmitting ? null : pickResume,
                child: Text(resumeFile == null ? "Upload Resume" : "Resume Uploaded"),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _coverLetterController,
                decoration: const InputDecoration(
                  labelText: "Cover Letter",
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) => value == null || value.isEmpty
                    ? "Please enter a cover letter"
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: isSubmitting ? null : submitForm,
                child: isSubmitting
                    ? const CircularProgressIndicator()
                    : const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
