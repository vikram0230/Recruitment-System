import 'package:flutter/material.dart';
import 'package:recruitment/Widgets/custom_textfield.dart';
import 'package:recruitment/Widgets/main_action_button.dart';

import '../constants.dart';

class CreateJob extends StatefulWidget {
  static String route = 'createjob';
  @override
  _CreateJobState createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

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
