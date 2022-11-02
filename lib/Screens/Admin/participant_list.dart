// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParticipantList extends StatefulWidget {
  final String programmeName;
  const ParticipantList({super.key, required this.programmeName});

  @override
  State<ParticipantList> createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  List<dynamic> participantData = [];
  List<Map> data = [];
  int length = 0;
  @override
  void initState() {
    super.initState();
    data = [];
    participantData = [];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(data[0]['name']);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child:
                  // Container()
                  ListView.builder(
                itemBuilder: (context, index) {
                  // final programmeName = users![index].programme;
                  return ElevatedButton(
                      onPressed: () {
                        // print(programmeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data[index]['name'] ?? ''),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(data[index]['team'] ?? '')
                        ],
                      ));
                  // child: const Text(''));
                },
                itemCount: data.length,
              ))),
    );
  }

  getUserData() {
    FirebaseFirestore.instance
        .collection('programmes')
        .doc(widget.programmeName)
        .get()
        .then((value) {
      participantData = value.get('participant');
      length = participantData.length;
      // print(length);

      for (int i = 0; i <= length - 1; i++) {
        data.add(participantData[i]);
      }
      print(data);
      setState(() {});

      // print(data[0]['name']);
    });
  }
}
