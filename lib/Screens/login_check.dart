import 'package:cognizium/Screens/Home_page.dart';
import 'package:cognizium/Screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('place menu');
            return const HomePage();
          } else {
            print('Login pages');
            return const SignIn();
          }
        },
      ),
    );
  }
}
