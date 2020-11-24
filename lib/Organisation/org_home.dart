import 'package:flutter/material.dart';
import 'package:recruitment/Candidate/candidate_profile.dart';
import 'package:recruitment/Organisation/create_job_vacancy.dart';
import 'package:recruitment/Organisation/org_profile.dart';
import 'package:recruitment/Widgets/jobcard.dart';
import 'package:recruitment/Widgets/main_action_button.dart';
import 'package:recruitment/constants.dart';

class OrganisationHome extends StatefulWidget {
  static String route = 'orghome';

  @override
  _OrganisationHomeState createState() => _OrganisationHomeState();
}

class _OrganisationHomeState extends State<OrganisationHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
                Navigator.pushNamed(context, OrganisationProfile.route);
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
                  'Create Job',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, CreateJob.route);
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
        child: JobCard(
          label: '',
        ),
      ),
    );
  }
}


