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
  List<List> team = [];
  // List<int> points = [];
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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: ElevatedButton(
        //         onPressed: resetPointTable,
        //         child: const Text("Reset Point Table")),
        //   )
        // ],
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
                                    child: Center(child: Text(team[index][0]))),
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
                                        child: Text(team[index][1].toString())))
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
    // points = [];
    print(team);
    FirebaseFirestore.instance
        .collection('points')
        .doc('points')
        .get()
        .then((value) {
      // print(value.data());
      final data = value.data();
      data?.forEach((key, value) {
        print(value);
        team.add([key, value]);

        // points.add(value);
      });

      for (int i = 0; i < 6; i++) {
        for (int j = i + 1; j < 6; j++) {
          if (team[i][1] < team[j][1]) {
            List a = team[i];
            team[i] = team[j];
            team[j] = a;
          }
        }
      }

      setState(() {});
    });
  }

  resetPointTable() async {
    final points =
        FirebaseFirestore.instance.collection('points').doc('points');
    await points.update({
      'Bagdad': 0,
      'Dimashk': 0,
      'Iskanthar': 0,
      'Khairuvaan': 0,
      'Qurthuba': 0,
      'khurasan': 0
    });
    setState(() {});
  }
}
