import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';




class ApplyNow extends StatefulWidget {
  const ApplyNow({super.key});

  @override
  State<ApplyNow> createState() => _ApplyNowState();
}

class _ApplyNowState extends State<ApplyNow> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController coverLetterController = TextEditingController();

  String? highestQualification;
  String? passingYear;
 

  String? resumeFilePath; // Variable to store the path of the uploaded resume

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply Now"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Email Address
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                      .hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Phone Number
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  } else if (value.length != 10 ||
                      !RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Highest Qualification
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                    labelText: 'Highest Qualification',
                    border: OutlineInputBorder()),
                value: highestQualification,
                items: ['Undergraduate', 'Postgraduate', 'MBA', 'Other']
                    .map((qualification) => DropdownMenuItem(
                          value: qualification,
                          child: Text(qualification),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    highestQualification = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a qualification';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Specialization
              TextFormField(
                controller: specializationController,
                decoration: const InputDecoration(
                  labelText: 'Specialization/Field of Study',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Specialization is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Passing Year
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                    labelText: 'Passing Year',
                    border: OutlineInputBorder()),
                value: passingYear,
                items: List.generate(50, (index) =>
                        (DateTime.now().year - index).toString())
                    .map((year) => DropdownMenuItem(
                          value: year,
                          child: Text(year),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    passingYear = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a passing year';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

      
             

              // Resume Upload
              
              const Text(
                'Upload Resume',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5,),
              ElevatedButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles();
                  if (result != null && result.files.isNotEmpty) {
                    setState(() {
                      resumeFilePath = result.files.first.path; // Store the file path
                    });
                  }
                },
                child: const Text('Choose File'),
              ),
              const SizedBox(height: 20),

              // Cover Letter
              TextFormField(
                controller: coverLetterController,
                decoration: const InputDecoration(
                    labelText: 'Cover Letter (Optional)', border: OutlineInputBorder()),
                maxLines: 5,
              ),
              const SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (highestQualification == null || passingYear == null) {
                        // Show a validation error if something is missing
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fill in all required fields")),
                        );
                        return;
                      }

                    
                
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
