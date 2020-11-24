import 'package:flutter/material.dart';
import 'package:recruitment/Widgets/custom_textfield.dart';
import 'package:recruitment/Widgets/main_action_button.dart';

import '../constants.dart';

class OrganisationProfile extends StatefulWidget {
  static String route = 'orgprofile';
  @override
  _OrganisationProfileState createState() => _OrganisationProfileState();
}

class _OrganisationProfileState extends State<OrganisationProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ceoController = TextEditingController();
  TextEditingController networthController = TextEditingController();

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
