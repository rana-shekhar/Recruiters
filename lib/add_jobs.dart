import 'package:flutter/material.dart';
import 'package:recruiters/job_data.dart';

class AddJobs extends StatefulWidget {
  final JobData jobData;
  const AddJobs({super.key, required this.jobData});

  @override
  State<AddJobs> createState() => _AddJobsState();
}

class _AddJobsState extends State<AddJobs> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  DateTime? applicationDeadline;

  @override
  void initState() {
    super.initState();
    jobTitleController.text = widget.jobData.jobTitle;
    jobTypeController.text = widget.jobData.jobType;
    jobModelController.text = widget.jobData.jobModel;
    salaryDetailsController.text = widget.jobData.salary;
    roleDescriptionController.text = widget.jobData.roleDescription;
    experienceController.text = widget.jobData.experience;
    educationController.text = widget.jobData.education;
    skillRequirementController.text = widget.jobData.skillRequirement;
    aboutCompanyController.text = widget.jobData.aboutCompany;
    countryController.text = widget.jobData.country;
    stateController.text = widget.jobData.state;
    cityController.text = widget.jobData.city;
    pincodeController.text = widget.jobData.pincode;
    companyAddressController.text = widget.jobData.companyAddress;
    qualificationController.text = widget.jobData.qualification;
    applicationDeadline = widget.jobData.applicationDeadline;
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
              TextFormField(
                controller: jobTitleController,
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Job Title is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: jobTypeController,
                decoration: const InputDecoration(
                  labelText: 'Job Type',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Job Type is required';
                  }
                  return null;
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
