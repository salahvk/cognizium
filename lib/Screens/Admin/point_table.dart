// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PointTable extends StatefulWidget {
  const PointTable({
    super.key,
  });

  @override
  State<PointTable> createState() => _PointTableState();
}

class _PointTableState extends State<PointTable> {
  List<dynamic> participantData = [];
  // List<Map> data = [];
  List<String> team = [];
  List<int> points = [];
  int length = 0;
  @override
  void initState() {
    super.initState();
    // data = [];
    participantData = [];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getPointTableData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(data[0]['name']);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
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
                  const SizedBox(
                    height: 10,
                  ),
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
                                    child: Center(child: Text(team[index]))),
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
                                        child: Text(points[index].toString())))
                              ],
                            ));
                        // child: const Text(''));
                      },
                      itemCount: team.length,
                    ),
                  ),
                ],
              ))),
    );
  }

  getPointTableData() {
    team = [];
    points = [];
    print(team);
    FirebaseFirestore.instance
        .collection('points')
        .doc('points')
        .get()
        .then((value) {
      // print(value.data());
      final data = value.data();
      data?.forEach((key, value) {
        team.add(key);
        points.add(value);
        print(key + value.toString());
        print(team);
      });
      setState(() {});
      // participantData = value.get('participant');
      // length = participantData.length;
      // // print(length);

      // for (int i = 0; i <= length - 1; i++) {
      //   data.add(participantData[i]);
      // }
      // print(data);
      // setState(() {});

      // print(data[0]['name']);
    });
  }
}
