import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/model/eventsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProgrammesList extends StatefulWidget {
  String? name;
  String? email;
  String? uid;
  ProgrammesList({super.key, required this.name, this.email, this.uid});

  @override
  State<ProgrammesList> createState() => _ProgrammesListState();
}

class _ProgrammesListState extends State<ProgrammesList> {
  User? authUser;
  DocumentReference<Map<String, dynamic>>? collectionData;
  @override
  void initState() {
    print(widget.name);
    super.initState();
    authUser = FirebaseAuth.instance.currentUser;

    collectionData = authUser!.email! == 'cogniziumofficial@gmail.com'
        ? FirebaseFirestore.instance
            .collection(widget.email!)
            .doc(widget.uid)
            .collection('Participants')
            .doc(widget.name)
        : FirebaseFirestore.instance
            .collection(authUser!.email!)
            .doc(authUser?.uid)
            .collection('Participants')
            .doc(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Programme List',
      //     style: TextStyle(color: ColorManager.background, fontSize: 30),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: .1)),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Stage Events",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    width: w * .2,
                    child: StreamBuilder<List<EventsModel>>(
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              'Something went wrong! ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          final users = snapshot.data;

                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Center(
                                  child: Container(
                                    child: Text(users?[index].event ?? ''),
                                  ),
                                ),
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
                ],
              ),
            ),

            // * Off stage events

            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: .1)),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Off Stage Events",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    width: w * .2,
                    child: StreamBuilder<List<EventsModel>>(
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              'Something went wrong! ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          final users = snapshot.data;

                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Center(
                                  child: Container(
                                    child: Text(users?[index].event ?? ''),
                                  ),
                                ),
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

            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: .1)),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "General Stage Events",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    width: w * .2,
                    child: StreamBuilder<List<EventsModel>>(
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              'Something went wrong! ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          final users = snapshot.data;

                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Center(
                                  child: Container(
                                    child: Text(users?[index].event ?? ''),
                                  ),
                                ),
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
                      stream: readgStage(),
                    ),
                  ),
                ],
              ),
            ),

            // * general off stage

            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: .1)),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "General off Stage Events",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    width: w * .2,
                    child: StreamBuilder<List<EventsModel>>(
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              'Something went wrong! ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          final users = snapshot.data;

                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Center(
                                  child: Container(
                                    child: Text(users?[index].event ?? ''),
                                  ),
                                ),
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
                      stream: readgOffStage(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Stream<List<EventsModel>> readStage() {
    final data = collectionData!.collection('Stage').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => EventsModel.fromJson(e.data())).toList());
    return data;
  }

  Stream<List<EventsModel>> readOffStage() {
    final data = collectionData!.collection('offStage').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => EventsModel.fromJson(e.data())).toList());
    return data;
  }

  Stream<List<EventsModel>> readgStage() {
    final data = collectionData!.collection('gStage').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => EventsModel.fromJson(e.data())).toList());
    return data;
  }

  Stream<List<EventsModel>> readgOffStage() {
    final data = collectionData!.collection('goffStage').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => EventsModel.fromJson(e.data())).toList());
    return data;
  }
}
