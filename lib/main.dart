import 'package:flutter/material.dart';
import 'package:recruitment/Candidate/candidate_home.dart';
import 'package:recruitment/Candidate/candidate_profile.dart';
import 'package:recruitment/Home.dart';
import 'package:recruitment/Organisation/create_job_vacancy.dart';
import 'package:recruitment/Organisation/org_home.dart';
import 'package:recruitment/Organisation/org_profile.dart';
import 'package:recruitment/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyCVQRkyGFknC7IdiRrWzx0RsEhfQ4OACjs",
  //     authDomain: "recruitment-system-2658f.firebaseapp.com",
  //     databaseURL: "https://recruitment-system-2658f.firebaseio.com",
  //     projectId: "recruitment-system-2658f",
  //     storageBucket: "recruitment-system-2658f.appspot.com",
  //     messagingSenderId: "354638760368",
  //     appId: "1:354638760368:web:285715041094bd64602e75",
  //   ),
  // );
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
