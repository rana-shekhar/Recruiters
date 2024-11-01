import 'package:recruiters/job_data.dart';

class DataHelper {
 static final List <JobData> _jobList = [];

  void addJob(JobData jobData) {
    _jobList.add(jobData);
  }

  List<JobData> allData() {
    return _jobList;
  }
}
