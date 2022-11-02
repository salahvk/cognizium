import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/components/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogueBox extends StatelessWidget {
  const DialogueBox({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(context) {
    print('object');
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        height: MediaQuery.of(context).size.height / 2.4,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Delete the field!",
              style: TextStyle(
                  fontFamily: "Open",
                  color: ColorManager.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 65),
            SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: LottieBuilder.asset("assets/delete.json")),
            const Text(
              "If you delete the data it will get removed from all the users",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Open",
                  fontWeight: FontWeight.bold,
                  color: ColorManager.background),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "I Don't Want To",
                      style: TextStyle(
                        fontFamily: "Open",
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    )),
                TextButton(
                    onPressed: () async {
                      print(id);
                      final authUser = FirebaseAuth.instance.currentUser;
                      final docUser = FirebaseFirestore.instance
                          .collection(authUser!.email!)
                          .doc(authUser.uid)
                          .collection('Participants')
                          .doc(id);
                      docUser.delete();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Allow",
                      style: TextStyle(
                        fontFamily: "Open",
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
