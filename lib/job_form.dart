import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recruiters/data_helper.dart';
import 'package:recruiters/job_data.dart';
import 'package:recruiters/model/areamodel.dart';
import 'package:recruiters/model/citymodel.dart';
import 'package:recruiters/utiles.dart';

class JobForm extends StatefulWidget {
  const JobForm({super.key});

  @override
  JobFormState createState() => JobFormState();
}

class JobFormState extends State<JobForm> {
  Utiles utiles = Utiles();
  final formKey = GlobalKey<FormState>();

  // Form field controllers
  // String jobTitleController = "App Developer";
  // TextEditingController jobTypeController = TextEditingController();
  // TextEditingController jobModelController = TextEditingController();
  TextEditingController salaryDetailsController =
      TextEditingController(text: '20k');
  TextEditingController roleDescriptionController =
      TextEditingController(text: "nothing");
  // TextEditingController experienceController = TextEditingController();
  TextEditingController educationController =
      TextEditingController(text: "Graduate");
  TextEditingController skillRequirementController =
      TextEditingController(text: "flutter");
  TextEditingController aboutCompanyController =
      TextEditingController(text: "kodeleaf");
  TextEditingController countryController =
      TextEditingController(text: "India");
  TextEditingController stateController =
      TextEditingController(text: "Haryana");
  TextEditingController cityController = TextEditingController(text: "Hisar");
  TextEditingController pincodeController =
      TextEditingController(text: "123321");
  TextEditingController companyAddressController =
      TextEditingController(text: "Hisar");
  TextEditingController qualificationController = TextEditingController();
  DateTime? applicationDeadline;
  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  // List<String> jobTitle = ['Software Developer', 'Cook', 'App Developer'];
  final jobTitle = JobTitle();
  String? selectedTitle;
  final experience = Experience();
  String? experienceValue;
  final jobType = JobType();
  String? jobTypeValue;
  final jobModel = JobModel();
  String? jobModelValue;

  String? cityValue;
  List<City> cityList = [];
  String? areaValue;
  List<Area> areaList = [];

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != applicationDeadline) {
      setState(() {
        applicationDeadline = picked;
      });
    }
  }

  File? _imageFile;
  String imageUrl = '';
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      Utiles utiles = Utiles();
      imageUrl = await utiles.uploadTask(
          _imageFile!.path, DateTime.now().microsecondsSinceEpoch.toString());
    } else {
      // print("User ne image select nahi ki.");
    }
  }

  void deleteImage() {
    setState(() {
      _imageFile = null; // Set the image file to null to allow re-upload
      imageUrl = ''; // Reset the uploaded image URL
    });
  }

  // Validation methods
  String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  String? validateJobTitle(String? value) {
    return validateNotEmpty(value, 'Job Title');
  }

  String? validateJobType(String? value) {
    return validateNotEmpty(value, 'Job Type');
  }

  String? validateJobModel(String? value) {
    return validateNotEmpty(value, 'Job Model');
  }

  String? validateSalaryDetails(String? value) {
    return validateNotEmpty(value, 'Salary Details');
  }

  String? validateApplicationDeadline(DateTime? value) {
    if (value == null) {
      return 'Application Deadline cannot be empty';
    }
    if (value.isBefore(DateTime.now())) {
      return 'Application Deadline cannot be a past date';
    }
    return null;
  }

  String? validateRoleDescription(String? value) {
    return validateNotEmpty(value, 'Role Description');
  }

  String? validateExperience(String? value) {
    return validateNotEmpty(value, 'Experience');
  }

  String? validateEducation(String? value) {
    return validateNotEmpty(value, 'Education');
  }

  String? validateSkillRequirement(String? value) {
    return validateNotEmpty(value, 'Skill Requirement');
  }

  String? validateCompanyInfo(String? value) {
    return validateNotEmpty(value, 'Company Info');
  }

  String? validateCountry(String? value) {
    return validateNotEmpty(value, 'Country');
  }

  String? validateState(String? value) {
    return validateNotEmpty(value, 'State');
  }

  String? validateCity(String? value) {
    return validateNotEmpty(value, 'City');
  }

  String? validatePincode(String? value) {
    return validateNotEmpty(value, 'Pincode');
  }

  String? validateCompanyAddress(String? value) {
    return validateNotEmpty(value, 'Company Address');
  }

  void resetForm() {
    // jobTitleController.clear();
    // jobTypeController.clear();
    // jobModelController.clear();
    salaryDetailsController.clear();
    roleDescriptionController.clear();
    // experienceController.clear();
    educationController.clear();
    skillRequirementController.clear();
    aboutCompanyController.clear();
    countryController.clear();
    stateController.clear();
    cityController.clear();
    pincodeController.clear();
    companyAddressController.clear();

    setState(() {
      applicationDeadline = null;
    });
  }

  void fetchCities() {
    Utiles utiles = Utiles();
    utiles.fetchCities().then((value) {
      setState(() {
        cityList = utiles.cityList;
      });
    });
  }

  void fetchAreas() {
    Utiles utiles = Utiles();
    utiles.fetchAreas(cityValue).then((value) {
      setState(() {
        areaList = utiles.areaList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Job Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                ),
                value: selectedTitle,
                items: jobTitle.jobTitleList.map((title) {
                  return DropdownMenuItem(
                    value: title,
                    child: Text(title),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTitle = value.toString();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select Placetype.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Job Type',
                  border: OutlineInputBorder(),
                ),
                value: jobTypeValue,
                items: jobType.jobTypeList.map((title) {
                  return DropdownMenuItem(
                    value: title,
                    child: Text(title),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    jobTypeValue = value.toString();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select Placetype.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Job Model',
                  border: OutlineInputBorder(),
                ),
                value: jobModelValue,
                items: jobModel.jobModellist.map((title) {
                  return DropdownMenuItem(
                    value: title,
                    child: Text(title),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    jobModelValue = value.toString();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select Placetype.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: salaryDetailsController,
                decoration: const InputDecoration(
                  labelText: 'Salary Details',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateSalaryDetails(value),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  applicationDeadline == null
                      ? 'Select Application Deadline'
                      : 'Application Deadline: ${DateFormat('yyyy-MM-dd').format(applicationDeadline!)}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => selectDate(context),
              ),
              if (applicationDeadline != null)
                Text(
                  validateApplicationDeadline(applicationDeadline) ?? '',
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 10),
              TextFormField(
                controller: roleDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Role Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateRoleDescription(value),
              ),
              const SizedBox(height: 20),

              // Qualification Section
              const Text(
                'Qualification',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Experience',
                  border: OutlineInputBorder(),
                ),
                value: experienceValue,
                items: experience.experienceList.map((title) {
                  return DropdownMenuItem(
                    value: title,
                    child: Text(title),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    experienceValue = value.toString();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select Placetype.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: educationController,
                decoration: const InputDecoration(
                  labelText: 'Education',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateEducation(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: skillRequirementController,
                decoration: const InputDecoration(
                  labelText: 'Skill Requirement',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateSkillRequirement(value),
              ),
              const SizedBox(height: 20),
              // Company Details Section
              const Text(
                "Upload Profile Picture",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _imageFile == null
                    ? pickImage
                    : null, // Define what happens when button is pressed
                icon: const Icon(Icons.image,
                    color: Colors.white), // Icon and its color
                label: const Text("Choose Image"), // Button label text
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              if (_imageFile != null)
                Image.file(
                  _imageFile!,
                  width: 100,
                  height: 100,
                ),
              Image.network(
                imageUrl,
                fit: BoxFit
                    .cover, // How the image is inscribed into the allocated space.
                width: 100, // Optional width of the image.
                height: 100, // Optional height of the image.
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Return the image when it's fully loaded.
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  // Replace the error icon with a placeholder widget or hide it
                  return const Icon(Icons.error);
                },
              ),

              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: deleteImage, // Delete image when pressed
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Company Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: aboutCompanyController,
                decoration: const InputDecoration(
                  labelText: 'About Company',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateCompanyInfo(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: countryController,
                decoration: const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateCountry(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: stateController,
                decoration: const InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateState(value),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
                value: cityValue,
                items: cityList.map((city) {
                  return DropdownMenuItem(
                    value: city.cityId,
                    child: Text(city.cityName ?? ''),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    cityValue = value;
                    fetchAreas();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select City.';
                  }

                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Area',
                  border: OutlineInputBorder(),
                ),
                value: areaValue,
                items: areaList.map((area) {
                  return DropdownMenuItem(
                    value: area.areaId,
                    child: Text(area.areaName ?? ''),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    areaValue = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select Area.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: pincodeController,
                decoration: const InputDecoration(
                  labelText: 'Pincode',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validatePincode(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: companyAddressController,
                decoration: const InputDecoration(
                  labelText: 'Company Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateCompanyAddress(value),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(9, 9),
                      ),
                    ],
                  ),
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    onPressed: () async {
                      // for database
                      Utiles utiles = Utiles();
                      final db = FirebaseFirestore.instance;
                      final logoUrl = await utiles.uploadTask(_imageFile!.path,
                          DateTime.now().microsecondsSinceEpoch.toString());
                      final jobDetails = JobData(
                        jobTitle: selectedTitle.toString(),
                        jobType: jobTypeValue.toString(),
                        jobModel: jobModelValue.toString(),
                        salary: salaryDetailsController.text,
                        roleDescription: roleDescriptionController.text,
                        qualification: qualificationController.text,
                        experience: experienceValue.toString(),
                        education: educationController.text,
                        skillRequirement: skillRequirementController.text,
                        aboutCompany: aboutCompanyController.text,
                        country: countryController.text,
                        state: stateController.text,
                        city: cityValue.toString(),
                        pincode: pincodeController.text,
                        companyAddress: companyAddressController.text,
                        applicationDeadline: applicationDeadline!,
                        isVerified: false,
                        approvalStatus: '',
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                        isActive: true,
                        logo: logoUrl,
                      );
                      await db
                          .collection("job")
                          .doc(jobDetails.id)
                          .set(jobDetails.toMap());
                      if (formKey.currentState!.validate() &&
                          validateApplicationDeadline(applicationDeadline) ==
                              null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Form submitted successfully!'),
                          ),
                        );
                        resetForm();
                      }
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
