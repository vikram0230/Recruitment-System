import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreHelper {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String candidateField = 'candidate';
  String organisationField = 'organisation';
  String jobVacanciesField = 'jobvacancy';
  String applicantsField = 'applicant';

  bool addCandidateToDatabase({
    String email,
    String uid,
  }) {
    Map<String, dynamic> data = {
      'email': email,
    };
    try {
      firestore.collection(candidateField).doc(uid).set(data);
      print(data);
      return true;
    } catch (e) {
      print(e);
    }
    return null;
  }

  bool addOrganisationToDatabase({
    String email,
    String uid,
  }) {
    Map<String, dynamic> data = {
      'email': email,
    };
    try {
      firestore.collection(organisationField).doc(uid).set(data);
      print(data);
      return true;
    } catch (e) {
      print(e);
    }
    return null;
  }

  bool addJobVacancy({
    String uid,
    var data,
  }) {
    try {
      firestore
          .collection(jobVacanciesField)
          .doc('${data['title']} ${data['company']}')
          .set(data);
      print(data);
      return true;
    } catch (e) {
      print(e);
    }
    return null;
  }

  updateOrganisationProfile({String uid, @required Map<String, dynamic> data}) {
    firestore
        .collection(organisationField)
        .doc(uid)
        .update(data)
        .then((result) {
      print('done');
    }).catchError((onError) {
      print(onError);
    });
  }

  updateCandidateProfile({String uid, @required Map<String, dynamic> data}) {
    firestore.collection(candidateField).doc(uid).update(data).then((result) {
      print('done');
    }).catchError((onError) {
      print(onError);
    });
  }

  dynamic getOrganisationData({String email, String uid}) async {
    return firestore.collection(organisationField).doc(uid).snapshots().first;
  }

  dynamic getCandidateData({String email, String uid}) async {
    return firestore.collection(candidateField).doc(uid).snapshots().first;
  }

  Stream<QuerySnapshot> getVacancyData() {
    // firestore.collection(jobVacanciesField).snapshots().listen((event) {
    //   print(event.docs.first.data());
    //   data = event.docs.first.data();
    //   return data;
    // });
    return firestore.collection(jobVacanciesField).snapshots();
  }

  dynamic createApplication({title, company, uid, name, edu1, edu2, edu3}) {
    Map<String, dynamic> data = {
      'status': 0,
      'name' : name,
      'education1' : edu1,
      'education2' : edu2,
      'education3' : edu3,
    };

    try {
      firestore.collection(jobVacanciesField).doc('$title $company').collection(applicantsField).doc(uid).set(data);
      return true;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Stream<QuerySnapshot> getApplicantData({title, company}) {
    return firestore.collection(jobVacanciesField).doc('$title $company').collection(applicantsField).snapshots();
  }

  getApplicationStatus({title, company, uid}) {
    return firestore.collection(jobVacanciesField).doc('$title $company').collection(applicantsField).doc(uid).get();
  }

  respondApplication({title, company, uid, status}) {
    Map<String, dynamic> data = {
      'status': status,
    };

    try {
      firestore.collection(jobVacanciesField).doc('$title $company').collection(applicantsField).doc(uid).update(data);
      return true;
    } catch (e) {
      print(e);
    }
    return null;
  }

  dynamic getData({id}) {
    var data;
    data = firestore.collection(jobVacanciesField).doc(id).snapshots();
    return data;
  }
}
