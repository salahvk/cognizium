import 'package:cognizium/Screens/Admin/programme_list.dart';
import 'package:cognizium/Screens/Admin/result_programme_page.dart';
import 'package:cognizium/Screens/Admin/teamDetails.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    navToProgramme(context);
                  },
                  child: const Text("Programme List")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    navToResultProgramme(context);
                  },
                  child: const Text("Results")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    navToBagdad(context);
                  },
                  child: const Text("Bagdad")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    navToDimashk(context);
                  },
                  child: const Text("Dimashk")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    navToIskanthar(context);
                  },
                  child: const Text("Iskanthar")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    navToKhurasan(context);
                  },
                  child: const Text("Khurasan")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    navToKhairuvan(context);
                  },
                  child: const Text("Khairuvaan")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    navToQurthuba(context);
                  },
                  child: const Text("Qurthuba")),
            )
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

  navToResultProgramme(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const ResultProgrammePage();
    }));
  }

  navToBagdad(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const TeamDetails(
        email: 'bgdsh@gmail.com',
        uid: '3A3P1kVfvBRcqmc3KLMONRFkvWN2',
      );
    }));
  }

  navToDimashk(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const TeamDetails(
        email: 'dmsqsh@gmail.com',
        uid: 'GgjPTgEylFSo4j9IymuUUkWOCiC3',
      );
    }));
  }

  navToIskanthar(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const TeamDetails(
        email: 'isqdrsh@gmail.com',
        uid: 'x1dzjKHwSJUthT25socsVDyHTYA2',
      );
    }));
  }

  navToKhurasan(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const TeamDetails(
        email: 'krsnsh@gmail.com',
        uid: '68OzKh2RfmXAg8ZAksQtjN60jSc2',
      );
    }));
  }

  navToKhairuvan(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const TeamDetails(
        email: 'krvnsh@gmail.com',
        uid: 'CkN9ZtDwwuZlC8Qf5ipFZRlHGuE3',
      );
    }));
  }

  navToQurthuba(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const TeamDetails(
        email: 'qrtbsh@gmail.com',
        uid: 'GjcyvIb0hff536siNsON76zQWzb2',
      );
    }));
  }
}
