import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recruiters/data_helper.dart';
import 'package:recruiters/job_data.dart';

import 'package:intl/intl.dart';
import 'package:recruiters/model/citymodel.dart';
import 'package:recruiters/utiles.dart';

class Demo extends StatefulWidget {
  final JobData jobData;

  const Demo({super.key, required this.jobData});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  Utiles utiles = Utiles();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DataHelper dataHelper = DataHelper();

  // Controllers for form fields
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController jobModelController = TextEditingController();
  TextEditingController salaryDetailsController = TextEditingController();
  TextEditingController roleDescriptionController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController skillRequirementController = TextEditingController();
  TextEditingController aboutCompanyController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  DateTime? applicationDeadline;

  // Radio button selection variable
  String approvalStatus = 'Approve';
  JobTitle jobTitle = JobTitle();
  String? selectedTitle;
  Experience experience = Experience();
  String? experienceValue;
  JobType jobType = JobType();
  String? jobTypeValue;
  JobModel jobModel = JobModel();
  String? jobModelValue;
  bool? isActive;
  String? cityValue;
  List<City> cityList = [];

  @override
  void initState() {
    super.initState();
    fetchCities();
    selectedTitle = widget.jobData.jobTitle;
    // jobTitleController.text = widget.jobData.jobTitle;
    jobTypeValue = widget.jobData.jobType;
    jobModelValue = widget.jobData.jobModel;
    salaryDetailsController.text = widget.jobData.salary;
    roleDescriptionController.text = widget.jobData.roleDescription;
    // experienceController.text = widget.jobData.experience;
    educationController.text = widget.jobData.education;
    experienceValue = widget.jobData.experience;
    skillRequirementController.text = widget.jobData.skillRequirement;
    aboutCompanyController.text = widget.jobData.aboutCompany;
    countryController.text = widget.jobData.country;
    stateController.text = widget.jobData.state;
    cityValue = widget.jobData.city;
    pincodeController.text = widget.jobData.pincode;
    companyAddressController.text = widget.jobData.companyAddress;
    qualificationController.text = widget.jobData.qualification;
    applicationDeadline = widget.jobData.applicationDeadline;
    isActive = widget.jobData.isActive;
  }

  void fetchCities() {
    Utiles utiles = Utiles();
    utiles.fetchCities().then((value) {
      setState(() {
        cityList = utiles.cityList;
      });
    });
  }

  // Date picker method
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: applicationDeadline ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != applicationDeadline) {
      setState(() {
        applicationDeadline = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Job Details'),
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
              const SizedBox(height: 10),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Salary Details are required';
                  }
                  return null;
                },
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
              const SizedBox(height: 10),
              TextFormField(
                controller: roleDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Role Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Role Description is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Education is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: skillRequirementController,
                decoration: const InputDecoration(
                  labelText: 'Skill Requirement',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Skill Requirement is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'About Company is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: countryController,
                decoration: const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Country is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: stateController,
                decoration: const InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'State is required';
                  }
                  return null;
                },
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
                    child: Text(city.cityName.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select City.';
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pincode is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: companyAddressController,
                decoration: const InputDecoration(
                  labelText: 'Company Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Company Address is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Approval Status',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RadioListTile<String>(
                title: const Text('Approve'),
                value: 'Approve',
                groupValue: approvalStatus,
                onChanged: (value) {
                  setState(() {
                    approvalStatus = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Reject'),
                value: 'Reject',
                groupValue: approvalStatus,
                onChanged: (value) {
                  setState(() {
                    approvalStatus = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Is Active",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Checkbox(
                value: isActive,
                onChanged: (bool? value) {
                  setState(() {
                    isActive = value ?? false;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Create updated job data
                    widget.jobData.jobTitle = selectedTitle.toString();
                    widget.jobData.jobType = jobTypeValue.toString();
                    widget.jobData.jobModel = jobModelValue.toString();
                    widget.jobData.salary = salaryDetailsController.text;
                    widget.jobData.roleDescription =
                        roleDescriptionController.text;
                    // widget.jobData.jobType = jobTypeController.text;
                    widget.jobData.experience = experienceValue.toString();
                    widget.jobData.education = educationController.text;
                    widget.jobData.skillRequirement =
                        skillRequirementController.text;
                    widget.jobData.aboutCompany = aboutCompanyController.text;
                    widget.jobData.country = countryController.text;
                    widget.jobData.state = stateController.text;
                    widget.jobData.city = cityValue!.toString();
                    widget.jobData.pincode = pincodeController.text;
                    widget.jobData.companyAddress =
                        companyAddressController.text;
                    widget.jobData.qualification = qualificationController.text;
                    widget.jobData.applicationDeadline = applicationDeadline!;
                    widget.jobData.isVerified =
                        approvalStatus == "Approve" ? true : false;
                    widget.jobData.isActive = isActive ?? false;

                    final db = FirebaseFirestore.instance;
                    db
                        .collection('job')
                        .doc(widget.jobData.id)
                        .set(widget.jobData.toMap());

                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
