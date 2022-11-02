import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/Screens/programmesList.dart';
import 'package:cognizium/model/participantData.dart';
import 'package:cognizium/widgets/home_category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeamDetails extends StatefulWidget {
  final String email;
  final String uid;
  const TeamDetails({super.key, required this.email, required this.uid});

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Welcome $team ',
      //     style: const TextStyle(color: ColorManager.whiteColor),
      //   ),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: ElevatedButton(
      //           onPressed: () {
      //             FirebaseAuth.instance.signOut();
      //             Navigator.pushAndRemoveUntil(context,
      //                 MaterialPageRoute(builder: (ctx) {
      //               return const SignIn();
      //             }), (route) => false);
      //           },
      //           child: const Text("Log out")),
      //     )
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      //       return const AddParticipant();
      //     }));
      //   },
      //   child: const Icon(Icons.add),
      // ),
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
                  onTap: () {
                    print(name![index]);
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return ProgrammesList(
                        name: name[index],
                      );
                    }));
                  },
                  // onLongPress: () {
                  //   print('hello');

                  //   showDialog(
                  //       context: context,
                  //       builder: (context) => DialogueBox(
                  //             id: name![index],
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
                              width: size.width * .05,
                              height: size.height / 10,
                              decoration: const BoxDecoration(
                                  // border: Border.all(color: Colors.white)
                                  ),
                              child: Center(
                                  child: Text('${index + 1}'.toString())),
                            ),
                            HomeCategory(
                                size: size, age: age, text: zone![index]),
                            HomeCategory(
                                size: size, age: age, text: name![index]),
                            HomeCategory(
                                size: size, age: age, text: place![index]),
                            HomeCategory(
                                size: size, age: age, text: age![index]),
                            HomeCategory(
                                size: size, age: age, text: father![index]),
                            HomeCategory(
                                size: size, age: age, text: contactNo![index]),
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
        .collection(widget.email)
        .doc(widget.uid)
        .collection('Participants')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Participants.fromJson(doc.data()))
            .toList());
  }
}
