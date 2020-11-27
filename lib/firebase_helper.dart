import 'package:firebase_auth/firebase_auth.dart';

import 'databasehelper.dart';

class FirebaseHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(User user) {
    return (user != null) ? user : null;
  }

  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return _userFromFirebase(result.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signInWithEmailAndPassword({
    String email,
    String password,
    bool isOrg,
  }) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(result.user);
  }

  Future signUpWithEmailAndPassword({
    String email,
    String password,
    bool isOrg,
  }) async {
    UserCredential result = await _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      if (isOrg) {
        FirestoreHelper()
          ..addOrganisationToDatabase(
            email: email,
            uid: value.user.uid,
          );
      } else {
        FirestoreHelper()
          ..addCandidateToDatabase(
            email: email,
            uid: value.user.uid,
          );
      }
      return value;
    });
    return _userFromFirebase(result.user);
  }

  Future<User> getCurrentUser() async {
    User user = _auth.currentUser;
    return user;
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return false;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  void sendEmailVerification() async {
    User user = _auth.currentUser;
    await user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    User user = _auth.currentUser;
    return user.emailVerified;
  }
}
