// import 'package:recruiters/job_data.dart';
// import 'package:recruiters/model/aspirant_data.dart';

class DataHelper {
  // static final List<JobData> _jobList = [];
  // static final List<JobData> _approveJobList = [];
  

  // void addJob(JobData jobData) {
  //   _jobList.add(jobData);
  //   _approveJobList.add(jobData);
  // }

  // void addAspirantData(JobData jobData ) {
  //   aspirantList.add(jobData);
  // }

  // List<JobData> allData() {
  //   return _jobList;
  // }

  // List<JobData> getApprovedList() {
  //   return _approveJobList;
  // }

  // void removeJobs() {
  //   _approveJobList.removeWhere((item) => item.isVerified == true);
  // }

  // List<JobData> getApprovedJobs() {
  //   List<JobData> approvedJobs = [];
  //   for (var job in _jobList) {
  //     if (job.isVerified) {
  //       approvedJobs.add(job);
  //     }
  //   }
  //   return approvedJobs;
  // }

  // static final List<JobData> getDisplayJobs = [];

  // void displayjobs() {
  //   getDisplayJobs.clear();
  //   for (var job in _jobList) {
  //     if (job.isVerified && job.isActive) {
  //       getDisplayJobs.add(job); // no duplicate
  //     }
  //   }
  // }

// Convert to a list when needed
// List<JobData> get displayJobsList => getDisplayJobs.toList();

  //   static final List<JobData> getHomeScreenjobs = [];
  // void getHomeJobs() {

  //   for (var job in _jobList) {
  //     if (job.isVerified && job.isActive) {
  //       getHomeScreenjobs.add(job);

  //     }
  //   }
  // }

  // List<JobData> getUnapprovedJobs() {
  //   List<JobData> unApprovedJobs = [];
  //   for (var job in _jobList) {
  //     if (!job.isVerified) {
  //       unApprovedJobs.add(job);
  //     }
  //   }
  //   return unApprovedJobs;
  // }
}

class JobTitle {
  final List<String> jobTitleList = [
    "Software Developer",
    "App Developer",
    "Cook",
    "Receptionist"
  ];
}

class Experience {
  final List<String> experienceList = ["Fresher", "1-2 years", "3-5 years"];
}

class JobType {
  final List<String> jobTypeList = ["Full-time", "internship", "Tempoprary"];
}

class JobModel {
  final List<String> jobModellist = ["Work From Home", "Hybrid", "On Site"];
}
