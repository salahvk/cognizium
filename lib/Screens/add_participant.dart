import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/Screens/Home_page.dart';
import 'package:cognizium/components/color_manager.dart';
import 'package:cognizium/components/styles_manager.dart';
import 'package:cognizium/controllers/controllers.dart';
import 'package:cognizium/model/participantData.dart';
import 'package:cognizium/utils/snack_bar.dart';
import 'package:cognizium/widgets/title_widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddParticipant extends StatefulWidget {
  const AddParticipant({Key? key}) : super(key: key);

  @override
  State<AddParticipant> createState() => _AddParticipantState();
}

class _AddParticipantState extends State<AddParticipant> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<String> items = [
      'Hi Zone',
      'D Zone',
      'P Zone',
      // 'Item4',
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TitleWidget(name: 'Zone'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade300,
                      // offset: const Offset(5, 8.5),
                    ),
                  ],
                ),
                child: Container(
                  width: size.width * .3,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                          color: ColorManager.black,
                        ),
                        hint: Text('Enter Zone',
                            style: getRegularStyle(
                                color: const Color.fromARGB(255, 173, 173, 173),
                                fontSize: 15)),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item,
                                      style: getRegularStyle(
                                          color: ColorManager.black,
                                          fontSize: 15)),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        buttonHeight: 40,
                        // buttonWidth: 140,
                        itemHeight: 40,
                        buttonPadding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
                        // dropdownWidth: size.width,
                        itemPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TitleWidget(name: 'Name'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: size.width * .3,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade300,
                      // offset: const Offset(5, 8.5),
                    ),
                  ],
                ),
                child: TextField(
                  // focusNode: nfocus,
                  style: const TextStyle(),
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Enter Name',
                      hintStyle: getRegularStyle(
                          color: const Color.fromARGB(255, 173, 173, 173),
                          fontSize: 15)),
                ),
              ),
            ),

            // * father

            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TitleWidget(name: 'Father'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: size.width * .3,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade300,
                      // offset: const Offset(5, 8.5),
                    ),
                  ],
                ),
                child: TextField(
                  // focusNode: nfocus,
                  style: const TextStyle(),
                  controller: fatherNameController,
                  decoration: InputDecoration(
                      hintText: "Enter Father's Name",
                      hintStyle: getRegularStyle(
                          color: const Color.fromARGB(255, 173, 173, 173),
                          fontSize: 15)),
                ),
              ),
            ),
            // * contact No
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TitleWidget(name: 'Contact No'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: size.width * .3,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade300,
                      // offset: const Offset(5, 8.5),
                    ),
                  ],
                ),
                child: TextField(
                  // focusNode: nfocus,
                  style: const TextStyle(),
                  controller: contactNoController,
                  decoration: InputDecoration(
                      hintText: 'Contact No',
                      hintStyle: getRegularStyle(
                          color: const Color.fromARGB(255, 173, 173, 173),
                          fontSize: 15)),
                ),
              ),
            ),
            // * Place
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TitleWidget(name: 'Place'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: size.width * .3,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade300,
                      // offset: const Offset(5, 8.5),
                    ),
                  ],
                ),
                child: TextField(
                  // focusNode: nfocus,
                  style: const TextStyle(),
                  controller: addressController,
                  decoration: InputDecoration(
                      hintText: 'Enter Place',
                      hintStyle: getRegularStyle(
                          color: const Color.fromARGB(255, 173, 173, 173),
                          fontSize: 15)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TitleWidget(name: 'Age'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: size.width * .3,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade300,
                      // offset: const Offset(5, 8.5),
                    ),
                  ],
                ),
                child: TextField(
                  // focusNode: nfocus,
                  style: const TextStyle(),
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: 'Enter Age',
                      hintStyle: getRegularStyle(
                          color: const Color.fromARGB(255, 173, 173, 173),
                          fontSize: 15)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: addParticipant, child: const Text("Add Participant"))
          ],
        ),
      ),
    );
  }

  addParticipant() async {
    if (nameController.text.isEmpty) {
      showSnackBar("Enter a Name!", context,
          icon: Icons.email, color: Colors.white);
    } else if (addressController.text.isEmpty) {
      showSnackBar("Enter a place!", context,
          icon: Icons.email, color: Colors.white);
    }

    final authUser = FirebaseAuth.instance.currentUser;
    print(authUser!.email);
    print(authUser.uid);
    final docUser = FirebaseFirestore.instance
        .collection(authUser.email!)
        .doc(authUser.uid)
        .collection('Participants')
        .doc(nameController.text);
    print(authUser.email);
    print(authUser.uid);
    final user = Participants(
        zone: selectedValue ?? '',
        name: nameController.text,
        father: fatherNameController.text,
        contactNo: contactNoController.text,
        place: addressController.text,
        age: ageController.text);
    final json = user.tojson();
    print(json);
    try {
      await docUser.set(json);
      print("Participant added");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
        return const HomePage();
      }), (route) => false);
    } on Exception {
      print('Some exception occured');
    }
  }
}
