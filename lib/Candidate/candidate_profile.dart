import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/Widgets/custom_textfield.dart';
import 'package:recruitment/Widgets/main_action_button.dart';

import '../constants.dart';
import '../databasehelper.dart';
import '../firebase_helper.dart';

class CandidateProfile extends StatefulWidget {
  static String route = 'candiprofile';
  final User user;
  final candidateData;

  const CandidateProfile({this.user, this.candidateData});
  @override
  _CandidateProfileState createState() => _CandidateProfileState();
}

class _CandidateProfileState extends State<CandidateProfile> {
  TextEditingController nameController;
  TextEditingController ageController;
  TextEditingController genderController;
  TextEditingController education1Controller;
  TextEditingController education2Controller;
  TextEditingController education3Controller;
  FirestoreHelper firestoreHelper = FirestoreHelper();
  FirebaseHelper firebaseHelper = FirebaseHelper();

  @override
  void initState() {
    super.initState();
    if(widget.candidateData.data()['name'] != null){
      nameController = TextEditingController(text: widget.candidateData['name']??'');
      ageController = TextEditingController(text: widget.candidateData['age']??'');
      genderController = TextEditingController(text: widget.candidateData['gender']??'');
      education1Controller = TextEditingController(text: widget.candidateData['education1']??'');
      education2Controller = TextEditingController(text: widget.candidateData['education2']??'');
      education3Controller = TextEditingController(text: widget.candidateData['education3']??'');
    }
    else {
      nameController = TextEditingController();
      ageController = TextEditingController();
      genderController = TextEditingController();
      education1Controller = TextEditingController();
      education2Controller = TextEditingController();
      education3Controller = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Profile'),
        centerTitle: true,
        backgroundColor: kdarkBlue,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: nameController,
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: ageController,
                      labelText: 'Age',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: genderController,
                      labelText: 'Gender',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: education1Controller,
                      labelText: 'Education 1',
                      prefixIcon: Icon(Icons.book),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: education2Controller,
                      labelText: 'Education 2',
                      prefixIcon: Icon(Icons.book),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: education3Controller,
                      labelText: 'Education 3',
                      prefixIcon: Icon(Icons.book),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: MainActionButton(
                    label: 'Save',
                    onPressed: () async {
                      firestoreHelper.updateCandidateProfile(
                        uid: widget.user.uid,
                        data: {
                          'name': nameController.text,
                          'age' : ageController.text,
                          'gender' : genderController.text,
                          'education1' : education1Controller.text,
                          'education2' : education2Controller.text,
                          'education3' : education3Controller.text,
                        },
                      );
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
