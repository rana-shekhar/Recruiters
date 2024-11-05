class JobData {
  String jobTitle;
  String jobType;
  String jobModel;
   String salary;
   DateTime applicationDeadline;
   String roleDescription;
   String qualification;
 String experience;
 String education;
String skillRequirement;
  String aboutCompany;
  String country;
  String state;
  String city;
  String pincode;
  String companyAddress;
  bool isVerified;
  String approvalStatus;

  JobData({
    required this.jobTitle,
    required this.jobType,
    required this.jobModel,
    required this.salary,
    required this.applicationDeadline,
    required this.roleDescription,
    required this.qualification,
    required this.experience,
    required this.education,
    required this.skillRequirement,
    required this.aboutCompany,
    required this.country,
    required this.state,
    required this.city,
    required this.pincode,
    required this.companyAddress,
    this.isVerified = false, 
    this.approvalStatus = '', 
  });

  Map<String, dynamic> toMap() {
    return {
      'jobTitle': jobTitle,
      'jobType': jobType,
      'jobModel': jobModel,
      'salary': salary,
      'applicationDeadline': applicationDeadline.toIso8601String(),
      'roleDescription': roleDescription,
      'qualification': qualification,
      'experience': experience,
      'education': education,
      'skillRequirement': skillRequirement,
      'aboutCompany': aboutCompany,
      'country': country,
      'state': state,
      'city': city,
      'pincode': pincode,
      'companyAddress': companyAddress,
      'isVerified': isVerified,
      'approvalStatus': approvalStatus,
    };
  }

  factory JobData.fromMap(Map<String, dynamic> map) {
    return JobData(
      jobTitle: map['jobTitle'] ?? '',
      jobType: map['jobType'] ?? '',
      jobModel: map['jobModel'] ?? '',
      salary: map['salary'] ?? '',
      applicationDeadline: DateTime.parse(map['applicationDeadline'] ?? ''),
      roleDescription: map['roleDescription'] ?? '',
      qualification: map['qualification'] ?? '',
      experience: map['experience'] ?? '',
      education: map['education'] ?? '',
      skillRequirement: map['skillRequirement'] ?? '',
      aboutCompany: map['aboutCompany'] ?? '',
      country: map['country'] ?? '',
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      pincode: map['pincode'] ?? '',
      companyAddress: map['companyAddress'] ?? '',
      isVerified: map['isVerified'] ?? false, 
      approvalStatus: map['approvalStatus'] ?? '',
    );
  }
}
