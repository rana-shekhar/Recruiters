import 'package:flutter/src/material/dropdown.dart';
import 'package:recruiters/job_data.dart';

class DataHelper {
  static final List<JobData> _jobList = [];
  static final List<JobData> _approveJobList = [];

  void addJob(JobData jobData) {
    _jobList.add(jobData);
    _approveJobList.add(jobData);
  }

  List<JobData> allData() {
    return _jobList;
  }

  List<JobData> getApprovedList() {
    return _approveJobList;
  }

  void removeJobs() {
    _approveJobList.removeWhere((item) => item.isVerified == true);
  }

  List<JobData> getApprovedJobs() {
    List<JobData> approvedJobs = [];
    for (var job in _jobList) {
      if (job.isVerified) {
        approvedJobs.add(job);
      }
    }
    return approvedJobs;
  }

  List<JobData> getUnapprovedJobs() {
    List<JobData> unApprovedJobs = [];
    for (var job in _jobList) {
      if (!job.isVerified) {
        unApprovedJobs.add(job);
      }
    }
    return unApprovedJobs;
  }
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
  final List<String> jobTypeList = [
    "Full-time",
    "internship",
    "Tempoprary"

  ];
}
