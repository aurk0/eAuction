import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_mail/page1.dart';
import 'package:practice_mail/singin.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? SignIn() : Page1(),
  ));
}
