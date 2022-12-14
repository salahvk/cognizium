// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/components/color_manager.dart';
import 'package:cognizium/components/styles_manager.dart';
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
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        title: Text(
          widget.programmeName,
          style: getBoldtStyle(color: ColorManager.whiteText, fontSize: 18),
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child:
                  // Container()
                  Column(
                children: [
                  // Container(
                  //   child: Text(widget.programmeName),
                  // ),

                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        // final programmeName = users![index].programme;
                        return ElevatedButton(
                            onPressed: () {
                              // print(programmeName);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: .5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child:
                                            Text('${index + 1}'.toString()))),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: .5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child:
                                            Text(data[index]['name'] ?? ''))),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: .5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(data[index]['team'] ?? '')))
                              ],
                            ));
                        // child: const Text(''));
                      },
                      itemCount: data.length,
                    ),
                  ),
                ],
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
