import 'package:flutter/material.dart';
import 'package:recruitment/Candidate/candidate_home.dart';
import 'package:recruitment/Organisation/org_home.dart';
import 'package:recruitment/Widgets/custom_textfield.dart';
import 'package:recruitment/Widgets/main_action_button.dart';
import 'package:recruitment/constants.dart';
import 'package:recruitment/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  static String route = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController oEmailController = TextEditingController();
  TextEditingController oPasswordController = TextEditingController();
  TextEditingController cEmailController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kdarkBlue,
        title: Text('Recruitment System'),
        centerTitle: true,
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
          color: kWhite,
          child: Row(
            children: [
              Container(
                width: size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Organisation Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: kdarkBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15),
                      child: CustomTextField(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        controller: oEmailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15),
                      child: CustomTextField(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        controller: oPasswordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15),
                      child: MainActionButton(
                        label: 'Login',
                        onPressed: () {
                          Navigator.pushNamed(context, OrganisationHome.route);
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, SignUpScreen.route);
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(color: kdarkBlue),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Candidate Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: kdarkBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15),
                      child: CustomTextField(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        controller: cEmailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15),
                      child: CustomTextField(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        controller: cPasswordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15),
                      child: MainActionButton(
                        label: 'Login',
                        onPressed: () {
                          Navigator.pushNamed(context, CandidateHome.route);
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, SignUpScreen.route);
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(color: kdarkBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
