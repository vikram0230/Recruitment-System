import 'package:flutter/material.dart';
import 'package:recruitment/Widgets/custom_textfield.dart';
import 'package:recruitment/Widgets/main_action_button.dart';

import '../constants.dart';

class CandidateProfile extends StatefulWidget {
  static String route = 'candiprofile';
  @override
  _CandidateProfileState createState() => _CandidateProfileState();
}

class _CandidateProfileState extends State<CandidateProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController education1Controller = TextEditingController();
  TextEditingController education2Controller = TextEditingController();
  TextEditingController education3Controller = TextEditingController();

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
                    onPressed: () {
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
