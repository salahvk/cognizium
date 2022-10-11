import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/model/eventsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProgrammesList extends StatefulWidget {
  String? name;
  ProgrammesList({super.key, required this.name});

  @override
  State<ProgrammesList> createState() => _ProgrammesListState();
}

class _ProgrammesListState extends State<ProgrammesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Column(
          children: [
            Row(
              children: const [
                Text("Stage Events"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: StreamBuilder<List<EventsModel>>(
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data;

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(users?[index].event ?? ''),
                        );
                      },
                      itemCount: users?.length,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                stream: readStage(),
              ),
            ),

            // * Off stage events

            Row(
              children: const [
                Text("Off Stage Events"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: StreamBuilder<List<EventsModel>>(
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data;

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(users?[index].event ?? ''),
                        );
                      },
                      itemCount: users?.length,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                stream: readOffStage(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stream<List<EventsModel>> readStage() {
    final authUser = FirebaseAuth.instance.currentUser;
    final data = FirebaseFirestore.instance
        .collection(authUser!.email!)
        .doc(authUser.uid)
        .collection('Participants')
        .doc(widget.name)
        .collection('Stage')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((e) => EventsModel.fromJson(e.data())).toList());
    return data;
  }

  Stream<List<EventsModel>> readOffStage() {
    final authUser = FirebaseAuth.instance.currentUser;
    final data = FirebaseFirestore.instance
        .collection(authUser!.email!)
        .doc(authUser.uid)
        .collection('Participants')
        .doc(widget.name)
        .collection('offStage')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((e) => EventsModel.fromJson(e.data())).toList());
    return data;
  }
}
