import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recruiters/job_data.dart';

import 'data_helper.dart';

class JobForm extends StatefulWidget {
  const JobForm({super.key});

  @override
  JobFormState createState() => JobFormState();
}

class JobFormState extends State<JobForm> {
  final formKey = GlobalKey<FormState>();

  // Form field controllers
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
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  DateTime? applicationDeadline;

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
    jobTitleController.clear();
    jobTypeController.clear();
    jobModelController.clear();
    salaryDetailsController.clear();
    roleDescriptionController.clear();
    experienceController.clear();
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
              const SizedBox(height: 10),
              TextFormField(
                controller: jobTitleController,
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateJobTitle(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: jobTypeController,
                decoration: const InputDecoration(
                  labelText: 'Job Type',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateJobType(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: jobModelController,
                decoration: const InputDecoration(
                  labelText: 'Job Model',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateJobModel(value),
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
              TextFormField(
                controller: experienceController,
                decoration: const InputDecoration(
                  labelText: 'Experience',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateExperience(value),
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
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateCity(value),
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

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate() &&
                      validateApplicationDeadline(applicationDeadline) ==
                          null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Form submitted successfully!')),
                    );

                    DataHelper dataHelper = DataHelper();
                    dataHelper.addJob(JobData(
                      jobTitle: jobTitleController.text,
                      jobType: jobTypeController.text,
                      jobModel: jobModelController.text,
                      salary: salaryDetailsController.text,
                      roleDescription: roleDescriptionController.text,
                      qualification: qualificationController.text,
                      experience: experienceController.text,
                      education: educationController.text,
                      skillRequirement: skillRequirementController.text,
                      aboutCompany: aboutCompanyController.text,
                      country: countryController.text,
                      state: stateController.text,
                      city: cityController.text,
                      pincode: pincodeController.text,
                      companyAddress: companyAddressController.text,
                     applicationDeadline: applicationDeadline!,
                     isVerified: false, 
                     approvalStatus: '',
                    ));
                    resetForm();
                   
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
