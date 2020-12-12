import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/Widgets/main_action_button.dart';

import '../constants.dart';
import '../databasehelper.dart';

class JobDetails extends StatefulWidget {
  final User user;
  final jobData;
  final candidateData;

  const JobDetails({this.user, this.jobData, this.candidateData});

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  FirestoreHelper firestoreHelper = FirestoreHelper();
  var jobStatusData;
  String jobStatus;
  var data;
  Color buttonColor;

  getJobStatus() async {
    jobStatusData = await firestoreHelper.getApplicationStatus(title: widget.jobData['title'], company: widget.jobData['company'], uid: widget.user.uid,);
    print((jobStatusData.data()!=null) ? jobStatusData.data()['status'] : 3);
    data = (jobStatusData.data()!=null) ? jobStatusData.data()['status'] : 3;
    switch (data){
      case 0 :
        jobStatus = 'Applied';
        break;
      case 1:
        jobStatus = 'Rejected';
        buttonColor = Colors.redAccent;
        break;
      case 2:
        jobStatus = 'Accepted';
        buttonColor = Colors.green;
        break;
      case 3:
        jobStatus = 'Apply for Job';
        break;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getJobStatus();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
        centerTitle: true,
        backgroundColor: kdarkBlue,
      ),
      body: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Title: ${widget.jobData['title']}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Company: ${widget.jobData['company']}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Description: ${widget.jobData['desc']}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Salary: ${widget.jobData['salary']}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: MainActionButton(
                label: jobStatus ?? '',
                color: buttonColor,
                onPressed: (jobStatus == 'Apply for Job') ? (){
                  firestoreHelper.createApplication(
                    title: widget.jobData['title'],
                    company: widget.jobData['company'],
                    uid: widget.user.uid,
                    name: widget.candidateData['name'],
                    edu1: widget.candidateData['education1'],
                    edu2: widget.candidateData['education2'],
                    edu3: widget.candidateData['education3'],
                  );
                  getJobStatus();
                } : (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
