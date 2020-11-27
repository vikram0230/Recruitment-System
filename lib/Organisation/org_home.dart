import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/Organisation/applicants.dart';
import 'package:recruitment/Organisation/create_job_vacancy.dart';
import 'package:recruitment/Organisation/org_profile.dart';
import 'package:recruitment/Widgets/jobcard.dart';
import 'package:recruitment/constants.dart';
import 'package:recruitment/databasehelper.dart';
import 'package:recruitment/firebase_helper.dart';

class OrganisationHome extends StatefulWidget {
  static String route = 'orghome';
  final User user;

  const OrganisationHome({this.user});

  @override
  _OrganisationHomeState createState() => _OrganisationHomeState();
}

class _OrganisationHomeState extends State<OrganisationHome> {
  FirebaseHelper firebaseHelper = FirebaseHelper();
  FirestoreHelper firestoreHelper = FirestoreHelper();
  var organisationData;

  getData() async {
    organisationData = await firestoreHelper.getOrganisationData(
      email: widget.user.email,
      uid: widget.user.uid,
    );
    // print(organisationData.data());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Organisation Home'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => OrganisationProfile(
                      user: widget.user,
                      organisationData: organisationData,
                    ),
                  ),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CreateJob(
                      user: widget.user,
                      organisationData: organisationData,
                    ),
                  ),
                );
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
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          width: size.width * 0.4,
          child: StreamBuilder(
            stream: firestoreHelper.getVacancyData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print('Error : ${snapshot.hasError}');
              print('data: ${snapshot.hasData}');
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data.docs[index].data();
                    print('Vacancy: $data');
                    // print(organisationData.data() != null);
                    if(organisationData.data()['name'] != null){
                      print(organisationData['name']);
                      if(organisationData['name'] == data['company']){
                        return JobCard(
                          title: data['title'],
                          salary: data['salary'],
                          company: data['company']??'',
                          label: 'View Applicants',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Applicants(
                                  data: data,
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                    return Container();
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
