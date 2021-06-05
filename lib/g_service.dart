import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice_mail/page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  getcurrentUser() {
    return auth.currentUser;
  }

  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  final GoogleSignIn _gSignIn = GoogleSignIn();
  signGoogle(BuildContext context) async {
    final GoogleSignInAccount _gSignInAccount = await _gSignIn.signIn();
    final GoogleSignInAuthentication _gSignInAuthentication =
        await _gSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: _gSignInAuthentication.idToken,
        accessToken: _gSignInAuthentication.accessToken);

    UserCredential result = await _fAuth.signInWithCredential(credential);
    if (result != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', result.user!.email.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Page1()));
    }
  }

  void signOut() async {
    await _gSignIn.signOut();
  }
}
