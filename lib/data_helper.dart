import 'package:recruiters/job_data.dart';

class DataHelper {
  static final List<JobData> _jobList = [];

  void addJob(JobData jobData) {
    _jobList.add(jobData);
  }

  List<JobData> allData() {
    return _jobList;
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
