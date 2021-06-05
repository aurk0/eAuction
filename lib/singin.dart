import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_mail/g_service.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/main.jpg'), fit: BoxFit.cover)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'eAuction',
                  style: TextStyle(
                      fontSize: 65,
                      fontFamily: 'ArchitectsDaughter',
                      color: Colors.tealAccent[700],
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'One Place-To Bid & Buy',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.indigo[800],
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 75,
                ),
                Text(
                  'Sign In to Enter',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SignInButton(
                    buttonType: ButtonType.google,
                    buttonSize: ButtonSize.medium,
                    onPressed: () {
                      GoogleAuth().signGoogle(context);
                    }),
              ],
            ),
          ),
        )
      ],
    );
  }
}
