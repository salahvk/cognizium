import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/Screens/Home_page.dart';
import 'package:cognizium/components/color_manager.dart';
import 'package:cognizium/components/styles_manager.dart';
import 'package:cognizium/controllers/controllers.dart';
import 'package:cognizium/model/participantData.dart';
import 'package:cognizium/provider/data_provider.dart';
import 'package:cognizium/utils/snack_bar.dart';
import 'package:cognizium/widgets/dZone.dart';
import 'package:cognizium/widgets/general.dart';
import 'package:cognizium/widgets/hizone.dart';
import 'package:cognizium/widgets/pZone.dart';
import 'package:cognizium/widgets/title_widgets.dart';
import 'package:cognizium/widgets/zone_title.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddParticipant extends StatefulWidget {
  const AddParticipant({Key? key}) : super(key: key);

  @override
  State<AddParticipant> createState() => _AddParticipantState();
}

class _AddParticipantState extends State<AddParticipant> {
  String? selectedValue;
  String? team;
  @override
  void initState() {
    super.initState();
    getTeam();
  }

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
      body: SingleChildScrollView(
        child: Padding(
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
                                  color:
                                      const Color.fromARGB(255, 173, 173, 173),
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
// * Hizone Programs
              selectedValue == 'Hi Zone'
                  ? Column(
                      children: [
                        ZoneTitle(
                            title1: 'Hi Zone Stage',
                            title2: 'Hi Zone off stage'),
                        const HizoneProgramsList(),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : Container(),

// * Dzone Programs
              selectedValue == 'D Zone'
                  ? Column(
                      children: [
                        ZoneTitle(
                            title1: 'D Zone Stage', title2: 'D Zone off stage'),
                        const DzoneProgramsList(),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : Container(),

// * Pzone Programs
              selectedValue == 'P Zone'
                  ? Column(
                      children: [
                        ZoneTitle(
                            title1: 'P Zone Stage', title2: 'P Zone off stage'),
                        const PzoneProgramsList(),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : Container(),

              //

              ZoneTitle(title1: 'General Stage', title2: 'General off stage'),
              const GeneralProgramsList(),
              ElevatedButton(
                  onPressed: addParticipant,
                  child: const Text("Add Participant")),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }

  addParticipant() async {
    final provider = Provider.of<DataProvider>(context, listen: false);
    if (nameController.text.isEmpty) {
      showSnackBar("Enter a Name!", context,
          icon: Icons.email, color: Colors.white);
      return;
    } else if (addressController.text.isEmpty) {
      showSnackBar("Enter a place!", context,
          icon: Icons.place, color: Colors.white);
      return;
    } else if (provider.stage.length > 4) {
      print(provider.stage);
      showSnackBar("Stage Items cant exceed 4!", context,
          icon: Icons.person, color: Colors.white);
      return;
    } else if (provider.offStage.length > 4 && selectedValue == 'Hi Zone') {
      print(provider.stage);

      showSnackBar("Hi Zone off Stage Items cant exceed 4!", context,
          icon: Icons.person, color: Colors.white);
      return;
    } else if (provider.offStage.length > 5 && selectedValue == 'D Zone') {
      print(provider.stage);
      showSnackBar("D Zone off Stage Items cant exceed 5!", context,
          icon: Icons.person, color: Colors.white);
      return;
    } else if (provider.offStage.length > 6 && selectedValue == 'P Zone') {
      print(provider.stage);
      showSnackBar("P Zone off Stage Items cant exceed 6!", context,
          icon: Icons.person, color: Colors.white);
      return;
    }

    final authUser = FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance
        .collection(authUser!.email!)
        .doc(authUser.uid)
        .collection('Participants')
        .doc(nameController.text);

    final user = Participants(
        zone: selectedValue ?? '',
        name: nameController.text,
        father: fatherNameController.text,
        contactNo: contactNoController.text,
        place: addressController.text,
        age: ageController.text);
    final json = user.tojson();

    // * adding events
    final stageData = provider.stage;
    final programsStage = docUser.collection('Stage');

    final offStageData = provider.offStage;
    final programsOffStage = docUser.collection('offStage');

    // * general

    final gstageData = provider.gstage;
    final gprogramsStage = docUser.collection('gStage');

    final goffStageData = provider.goffstage;
    final gprogramsOffStage = docUser.collection('goffStage');

    final programmes = FirebaseFirestore.instance.collection('programmes');

    // .collection('Participants')
    // .doc(nameController.text);

    final participantData = [
      {
        "name": nameController.text,
        'place': addressController.text,
        'team': team
      }
    ];

    try {
      await docUser.set(json);
      for (var element in stageData) {
        programsStage.doc(element).set({"event": element});

        programmes.doc('${selectedValue}_stage_$element').update({
          "participant": FieldValue.arrayUnion(participantData)
        }).onError((error, stackTrace) {
          programmes.doc('${selectedValue}_stage_$element').set({
            "participant": FieldValue.arrayUnion(participantData),
            "programme": '${selectedValue}_stage_$element'
          });
        });
      }
      for (var element in offStageData) {
        programsOffStage.doc(element).set({"event": element});
        programmes.doc('${selectedValue}_offStage_$element').update({
          "participant": FieldValue.arrayUnion(participantData)
        }).onError((error, stackTrace) {
          programmes.doc('${selectedValue}_offStage_$element').set({
            "participant": FieldValue.arrayUnion(participantData),
            "programme": '${selectedValue}_offStage_$element'
          });
        });
      }
      for (var element in gstageData) {
        gprogramsStage.doc(element).set({"event": element});
        programmes.doc('general_stage_$element').update({
          "participant": FieldValue.arrayUnion(participantData)
        }).onError((error, stackTrace) {
          programmes.doc('general_stage_$element').set({
            "participant": FieldValue.arrayUnion(participantData),
            "programme": 'general_stage_$element'
          });
        });
      }
      for (var element in goffStageData) {
        gprogramsOffStage.doc(element).set({"event": element});
        programmes.doc('general_offStage_$element').update({
          "participant": FieldValue.arrayUnion(participantData)
        }).onError((error, stackTrace) {
          programmes.doc('general_offStage_$element').set({
            "participant": FieldValue.arrayUnion(participantData),
            "programme": 'general_offStage_$element'
          });
        });
      }

      provider.cleanList();

      await Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) {
        return const HomePage();
      }), (route) => false);
    } on Exception {
      print('Some exception occured');
    }
  }

  getTeam() {
    final authUser = FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance
        .collection(authUser!.email!)
        .doc(authUser.uid)
        .get()
        .then((value) {
      team = value.get('team');
      print(team);
    });
  }
}
