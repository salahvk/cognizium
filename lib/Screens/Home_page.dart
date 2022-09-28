import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/Screens/add_participant.dart';
import 'package:cognizium/Screens/sign_in.dart';
import 'package:cognizium/model/participantData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _DataState();
}

class _DataState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final size = MediaQuery.of(context).size;

    List<String> statusList = ['Pending', 'Delivered', 'Not Delivered'];
    String? selectedStatus = '';
    String hint = 'Select item';
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${user.email} '),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return const AddParticipant();
          }));
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Participants>>(
        stream: readParticipants(),
        builder: (contexts, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data;

            //! declaration

            List<String>? zone = users?.map(((e) {
              return e.zone;
            })).toList();
            List<String>? name = users?.map(((e) {
              return e.name;
            })).toList();
            List<String>? place = users?.map(((e) {
              return e.place;
            })).toList();
            List<String>? age = users?.map(((e) {
              return e.age;
            })).toList();
            List<String>? father = users?.map(((e) {
              return e.father;
            })).toList();
            List<String>? contactNo = users?.map(((e) {
              return e.contactNo;
            })).toList();

            int? len = zone?.length;

            //! declaration

            //users!.map(buildUser).toList(),
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  // onLongPress: () {
                  //   print('hello');
                  //   print(id);

                  //   showDialog(
                  //       context: context,
                  //       builder: (context) => DialogueBox(
                  //             id: id![index],
                  //           ),
                  //       barrierDismissible: false);
                  // },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: Container(
                      height: size.height / 10,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade300, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width * .15,
                              height: size.height / 10,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Center(child: Text(zone![index])),
                            ),
                            Container(
                              width: size.width * .15,
                              height: size.height / 10,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: SingleChildScrollView(
                                      child: Text(name![index]))),
                            ),
                            Container(
                              width: size.width * .15,
                              height: size.height / 10,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: SingleChildScrollView(
                                      child: Text(place![index]))),
                            ),
                            Container(
                              width: size.width * .15,
                              height: size.height / 10,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: SingleChildScrollView(
                                      child: Text(age![index]))),
                            ),
                            Container(
                              width: size.width * .15,
                              height: size.height / 10,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: SingleChildScrollView(
                                      child: Text(father![index]))),
                            ),
                            Container(
                              width: size.width * .15,
                              height: size.height / 10,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: SingleChildScrollView(
                                      child: Text(contactNo![index]))),
                            ),
                            // Center(
                            //   child: Container(
                            //     width: size.width / 3.4,
                            //     height: size.height / 10,
                            //     decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.orange),
                            //       borderRadius: BorderRadius.circular(15),
                            //     ),
                            //     child: Padding(
                            //       padding:
                            //           const EdgeInsets.fromLTRB(6, 0, 0, 3),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: const [
                            //           // Expanded(
                            //           //   child: DropdownButtonHideUnderline(
                            //           //     child: DropdownButton2<String>(
                            //           //       value: status![index],
                            //           //       dropdownMaxHeight: size.height * .3,
                            //           //       isExpanded: true,
                            //           //       hint: Text(hint),
                            //           //       dropdownWidth: size.width / 3.5,
                            //           //       disabledHint: Text(hint),
                            //           //       items: statusList
                            //           //           .map(
                            //           //             (e) =>
                            //           //                 DropdownMenuItem<String>(
                            //           //               value: e,
                            //           //               child: Text(e),
                            //           //             ),
                            //           //           )
                            //           //           .toList(),
                            //           //       onChanged: (v) {
                            //           //         setState(() {
                            //           //           if (v != null) {
                            //           //             selectedStatus = v;
                            //           //             print(selectedStatus);
                            //           //             print(id![index]);
                            //           //             final docuser =
                            //           //                 FirebaseFirestore
                            //           //                     .instance
                            //           //                     .collection(
                            //           //                         'users data')
                            //           //                     .doc(id[index]);
                            //           //             docuser.update({
                            //           //               'status': '$selectedStatus'
                            //           //             });
                            //           //           } else {
                            //           //             selectedStatus = hint;
                            //           //           }
                            //           //         });
                            //           //       },
                            //           //     ),
                            //           //   ),
                            //           // ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: len,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Stream<List<Participants>> readParticipants() {
    final authUser = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance
        .collection(authUser!.email!)
        .doc(authUser.uid)
        .collection('Participants')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Participants.fromJson(doc.data()))
            .toList());
  }
}
