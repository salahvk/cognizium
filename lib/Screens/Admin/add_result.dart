import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/Screens/Admin/price_list.dart';
import 'package:cognizium/components/color_manager.dart';
import 'package:cognizium/components/styles_manager.dart';
import 'package:cognizium/controllers/controllers.dart';
import 'package:cognizium/provider/data_provider.dart';
import 'package:cognizium/utils/snack_bar.dart';
import 'package:cognizium/widgets/title_widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddResult extends StatefulWidget {
  final String programmeName;
  const AddResult({Key? key, required this.programmeName}) : super(key: key);

  @override
  State<AddResult> createState() => _AddResultState();
}

class _AddResultState extends State<AddResult> {
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
      'Bagdad',
      'Dimashk',
      'Iskanthar',
      'khurasan',
      'Khairuvaan',
      'Qurthuba'
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
                    style: const TextStyle(color: ColorManager.background),
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Enter Name',
                        hintStyle: getRegularStyle(
                            color: ColorManager.background, fontSize: 15)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TitleWidget(name: 'Team'),
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
                          hint: Text('Enter Team',
                              style: getRegularStyle(
                                  color: ColorManager.background,
                                  fontSize: 15)),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: getRegularStyle(
                                            color: ColorManager.background,
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
                    style: const TextStyle(color: ColorManager.background),
                    controller: placeController,
                    decoration: InputDecoration(
                        hintText: 'Enter Place',
                        hintStyle: getRegularStyle(
                            color: ColorManager.background, fontSize: 15)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TitleWidget(name: 'Point'),
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
                    style: const TextStyle(color: ColorManager.background),
                    controller: pointController,
                    decoration: InputDecoration(
                        hintText: 'Enter Point',
                        hintStyle: getRegularStyle(
                            color: ColorManager.background, fontSize: 15)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: addResult, child: const Text("Add Participant")),
            ],
          ),
        ),
      ),
    );
  }

  addResult() async {
    final provider = Provider.of<DataProvider>(context, listen: false);
    if (nameController.text.isEmpty) {
      showSnackBar("Enter a Name!", context,
          icon: Icons.email, color: Colors.white);
      return;
    } else if (placeController.text.isEmpty) {
      showSnackBar("Enter a place!", context,
          icon: Icons.place, color: Colors.white);
      return;
    } else if (pointController.text.isEmpty) {
      showSnackBar("Enter a point!", context,
          icon: Icons.place, color: Colors.white);
      return;
    }

    final programmes = FirebaseFirestore.instance.collection('programmes');

    // .collection('Participants')
    // .doc(nameController.text);

    final resultData = [
      {
        'name': nameController.text,
        'place': placeController.text,
        'points': pointController.text,
        'team': selectedValue
      }
    ];

    try {
      programmes.doc(widget.programmeName).set({
        "result": FieldValue.arrayUnion(resultData),
      });

      await Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) {
        return PriceListPage(
          programmeName: widget.programmeName,
        );
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
