import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/Screens/Admin/programme/participant_list.dart';
import 'package:cognizium/model/programmeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProgrammeListPage extends StatelessWidget {
  const ProgrammeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: StreamBuilder<List<ProgrammeModel>>(
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data;

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final programmeName = users![index].programme;
                        return ElevatedButton(
                            onPressed: () {
                              print(programmeName);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return ParticipantList(
                                    programmeName: programmeName ?? '');
                              }));
                            },
                            child: Text(programmeName ?? ''));
                      },
                      itemCount: users?.length ?? 0,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                stream: readParticipants(),
              ))),
    );
  }

  Stream<List<ProgrammeModel>> readParticipants() {
    final authUser = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance.collection('programmes').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => ProgrammeModel.fromJson(doc.data()))
            .toList());
  }
}
