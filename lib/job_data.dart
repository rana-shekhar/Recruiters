class JobData {
  final String jobTitle;
  final String jobType;
  final String jobModel;
  final String salary;
  // final DateTime applicationDeadline;  // DateTime field for application deadline
  final String roleDescription;
  final String qualification;
  final String experience;
  final String education;
  final String skillRequirement;
  final String aboutCompany; 
  final String country; 
  final String state; 
  final String city; 
  final String pincode; 
  final String companyAddress; 

  JobData({
    required this.jobTitle,
    required this.jobType,
    required this.jobModel,
    required this.salary,
    // required this.applicationDeadline,  // Required in the constructor
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
  });

  
  Map<String, dynamic> toMap() {
    return {
      'jobTitle': jobTitle,
      'jobType': jobType,
      'jobModel': jobModel,
      'salary': salary,
      // 'applicationDeadline': applicationDeadline.toIso8601String(), // Convert DateTime to String
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
    };
  }

  // Create a JobData object from a map
  factory JobData.fromMap(Map<String, dynamic> map) {
    return JobData(
      jobTitle: map['jobTitle'] ?? '',
      jobType: map['jobType'] ?? '',
      jobModel: map['jobModel'] ?? '',
      salary: map['salary'] ?? '',
      // applicationDeadline: DateTime.parse(map['applicationDeadline'] ?? ''), // Parse to DateTime
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
    );
  }
}
