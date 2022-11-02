import 'package:cognizium/Screens/Admin/programme_list.dart';
import 'package:cognizium/Screens/sign_in.dart';
import 'package:cognizium/components/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${user.email} ',
            style: const TextStyle(color: ColorManager.whiteColor)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (ctx) {
                    return const SignIn();
                  }), (route) => false);
                },
                child: const Text("Log out")),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  navToProgramme(context);
                },
                child: const Text("Programme List"))
          ],
        ),
      )),
    );
  }

  navToProgramme(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const ProgrammeListPage();
    }));
  }
}
