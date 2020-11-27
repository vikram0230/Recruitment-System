import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/Candidate/job_details.dart';
import 'package:recruitment/Candidate/candidate_profile.dart';
import 'package:recruitment/Widgets/jobcard.dart';
import 'package:recruitment/constants.dart';
import 'package:recruitment/firebase_helper.dart';

import '../databasehelper.dart';

class CandidateHome extends StatefulWidget {
  static String route = 'candihome';
  final User user;

  const CandidateHome({Key key, this.user}) : super(key: key);

  @override
  _CandidateHomeState createState() => _CandidateHomeState();
}

class _CandidateHomeState extends State<CandidateHome> {
  FirestoreHelper firestoreHelper = FirestoreHelper();
  FirebaseHelper firebaseHelper = FirebaseHelper();
  var candidateData;
  User user;

  getData() async {
    user = await firebaseHelper.getCurrentUser();
    print(user.uid);
    candidateData = await firestoreHelper.getCandidateData(
      email: user.email,
      uid: user.uid,
    );
    // print(candidateData.data());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Home'),
        centerTitle: true,
        backgroundColor: kdarkBlue,
      ),
      endDrawer: Container(
        width: size.width * 0.25,
        color: kWhite,
        child: Column(
          children: [
            ListTile(
              title: Center(
                child: Text(
                  '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              indent: 6,
              endIndent: 6,
              color: kLightBlue,
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CandidateProfile(
                      user: user,
                      candidateData: candidateData,
                    ),
                  ),
                );
              },
            ),
            Divider(
              thickness: 1,
              indent: 6,
              endIndent: 6,
              color: kLightBlue,
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          width: size.width * 0.4,
          child: StreamBuilder(
            stream: firestoreHelper.getVacancyData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print(snapshot.hasError);
              print(snapshot.hasData);
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var jobData = snapshot.data.docs[index].data();
                    print(jobData);
                    return JobCard(
                      title: jobData['title'],
                      salary: jobData['salary'],
                      company: jobData['company'] ?? '',
                      label: 'View Job',
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => JobDetails(
                              user: user,
                              jobData: jobData,
                              candidateData: candidateData,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
