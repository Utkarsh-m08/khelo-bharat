import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_hub/ui/screens/auth/authentication.dart';
import 'package:sports_hub/ui/screens/home/nav_bar.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // check if user logged in
          if (snapshot.hasData) {
            return NavBar();
            // Navigator.pop(context);
          }

          // user is not logged in
          else {
            return AuthenticationPage();
          }
        },
      ),
    );
  }
}
