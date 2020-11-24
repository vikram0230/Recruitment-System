import 'package:flutter/material.dart';
import 'package:recruitment/Candidate/candidate_home.dart';
import 'package:recruitment/Candidate/candidate_profile.dart';
import 'package:recruitment/Home.dart';
import 'package:recruitment/Organisation/create_job_vacancy.dart';
import 'package:recruitment/Organisation/org_home.dart';
import 'package:recruitment/Organisation/org_profile.dart';
import 'package:recruitment/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route : (context) => HomeScreen(),
        SignUpScreen.route : (context) => SignUpScreen(),
        CandidateHome.route : (context) => CandidateHome(),
        CandidateProfile.route : (context) => CandidateProfile(),
        OrganisationHome.route : (context) => OrganisationHome(),
        OrganisationProfile.route : (context) => OrganisationProfile(),
        CreateJob.route : (context) => CreateJob(),
      },
    );
  }
}
