import 'package:flutter/material.dart';
import 'package:recruitment/Widgets/applicant_card.dart';
import 'package:recruitment/Widgets/responded_card.dart';

import '../constants.dart';
import '../databasehelper.dart';

class Applicants extends StatefulWidget {
  final data;

  const Applicants({this.data});

  @override
  _ApplicantsState createState() => _ApplicantsState();
}

class _ApplicantsState extends State<Applicants> {
  FirestoreHelper firestoreHelper = FirestoreHelper();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicants'),
        centerTitle: true,
        backgroundColor: kdarkBlue,
      ),
      body: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          width: size.width * 0.4,
          child: StreamBuilder(
            stream: firestoreHelper.getApplicantData(
              title: widget.data['title'],
              company: widget.data['company'],
            ),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print(snapshot.hasError);
              print(snapshot.hasData);
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data.docs[index].data();
                    print(snapshot.data.docs[index].id);
                    print(data);
                    if(data['status'] == 0){
                      return ApplicantCard(
                        name: data['name'],
                        education:
                        'Education: ${data['education1']}, ${data['education2']}, ${data['education3']}',
                        acceptOnPressed: () {
                          firestoreHelper.respondApplication(
                            title: widget.data['title'],
                            company: widget.data['company'],
                            uid: snapshot.data.docs[index].id,
                            status: 2,
                          );
                        },
                        rejectOnPressed: () {
                          firestoreHelper.respondApplication(
                            title: widget.data['title'],
                            company: widget.data['company'],
                            uid: snapshot.data.docs[index].id,
                            status: 1,
                          );
                        },
                      );
                    } else {
                      return RespondedCard(
                        title: data['name'] ?? '',
                        subtitle: 'Education: ${data['education1']}, ${data['education2']}, ${data['education3']}',
                        status: data['status'],
                      );
                    }
                    // if(organisationData != null){
                    //   print(organisationData['name']);
                    //   if(organisationData['name'] == data['company']){
                    //     return JobCard(
                    //       title: data['title'],
                    //       salary: data['salary'],
                    //       company: data['company']??'',
                    //       label: 'View Applicants',
                    //       onPressed: () {},
                    //     );
                    //   }
                    // }
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
