import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/Widgets/custom_textfield.dart';
import 'package:recruitment/Widgets/main_action_button.dart';
import 'package:recruitment/databasehelper.dart';
import 'package:recruitment/firebase_helper.dart';

import '../constants.dart';

class CreateJob extends StatefulWidget {
  static String route = 'createjob';
  final User user;
  final organisationData;

  const CreateJob({this.user, this.organisationData});
  @override
  _CreateJobState createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  FirestoreHelper firestoreHelper = FirestoreHelper();
  FirebaseHelper firebaseHelper = FirebaseHelper();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Job'),
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
                      controller: titleController,
                      labelText: 'Job Title',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: descController,
                      labelText: 'Job Description',
                      minLines: 10,
                      maxLines: 10,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: salaryController,
                      labelText: 'Salary',
                      prefix: Text('₹'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: MainActionButton(
                    label: 'Save',
                    onPressed: () async {
                      firestoreHelper.addJobVacancy(
                        uid: widget.user.uid,
                        data: {
                          //TODO: Add Company Name
                          'company' : widget.organisationData['name'],
                          'title': titleController.text,
                          'desc' : descController.text,
                          'salary' : salaryController.text,
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
