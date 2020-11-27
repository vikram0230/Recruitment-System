import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/Widgets/custom_textfield.dart';
import 'package:recruitment/Widgets/main_action_button.dart';
import 'package:recruitment/databasehelper.dart';
import 'package:recruitment/firebase_helper.dart';

import '../constants.dart';

class OrganisationProfile extends StatefulWidget {
  static String route = 'orgprofile';
  final User user;
  final organisationData;

  const OrganisationProfile({this.user, this.organisationData});

  @override
  _OrganisationProfileState createState() => _OrganisationProfileState();
}

class _OrganisationProfileState extends State<OrganisationProfile> {
  TextEditingController nameController;
  TextEditingController ceoController;
  TextEditingController networthController;
  FirestoreHelper firestoreHelper = FirestoreHelper();
  FirebaseHelper firebaseHelper = FirebaseHelper();

  @override
  void initState() {
    super.initState();
    if(widget.organisationData.data()['name'] != null){
      nameController = TextEditingController(text: widget.organisationData['name']??'');
      ceoController = TextEditingController(text: widget.organisationData['ceo']??'');
      networthController = TextEditingController(text: widget.organisationData['networth']??'');
    } else {
      nameController = TextEditingController();
      ceoController = TextEditingController();
      networthController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Organisation Profile'),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: nameController,
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: ceoController,
                      labelText: 'CEO',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: networthController,
                      labelText: 'Net Worth',
                      prefix: Text('₹'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: MainActionButton(
                    label: 'Save',
                    onPressed: () {
                      firestoreHelper.updateOrganisationProfile(
                        uid: widget.user.uid,
                        data: {
                          'name': nameController.text,
                          'ceo' : ceoController.text,
                          'networth' : networthController.text,
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
