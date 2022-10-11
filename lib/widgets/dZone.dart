import 'package:cognizium/widgets/check_cus_list.dart';
import 'package:flutter/material.dart';

class DzoneProgramsList extends StatelessWidget {
  const DzoneProgramsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SerDrawerList(text: 'qira-ath'),
              SerDrawerList(text: 'hifz'),
              SerDrawerList(text: 'surf rile '),
              SerDrawerList(text: 'elocution malayalam '),
              SerDrawerList(text: 'elocution english'),
              SerDrawerList(text: 'elocution arabic '),
              SerDrawerList(text: 'Elocution urdu'),
              SerDrawerList(text: 'Hadees prabashanam'),
              SerDrawerList(text: 'History talk'),
              SerDrawerList(text: 'Aadarsha samarthana prasangam'),
              SerDrawerList(text: 'Alfiya aashaya vivarthanam'),
              SerDrawerList(text: 'Spot mas’ala'),
              SerDrawerList(text: 'Table talk english'),
              SerDrawerList(text: 'Mappilappatt'),
              SerDrawerList(text: 'Bakthiganam'),
              SerDrawerList(text: 'Madh ganam'),
              SerDrawerList(text: 'Group song'),
              SerDrawerList(text: 'Malappatt aavishkaram'),
              SerDrawerList(text: 'Quiz'),
              SerDrawerList(text: 'Hadees competition '),
              SerDrawerList(text: 'Problem solving'),
              SerDrawerList(text: 'Ia’rabul ia’rab'),
              SerDrawerList(text: 'Qaseeda recitation'),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SerDrawerList(text: 'Essay Malayalam', isStage: false),
              SerDrawerList(text: 'Essay english ', isStage: false),
              SerDrawerList(text: 'essay arabic', isStage: false),
              SerDrawerList(text: 'Essay urdu', isStage: false),
              SerDrawerList(
                  text: 'Translation (arabi,english)', isStage: false),
              SerDrawerList(
                  text: 'Translation (urdu,Malayalam)', isStage: false),
              SerDrawerList(
                  text: 'Translation (Malayalam,english)', isStage: false),
              SerDrawerList(text: 'Thashreeh', isStage: false),
              SerDrawerList(text: 'Madh gana rajana', isStage: false),
              SerDrawerList(text: 'poem making malayalam ', isStage: false),
              SerDrawerList(text: 'poem making english ', isStage: false),
              SerDrawerList(text: 'story writing english', isStage: false),
              SerDrawerList(text: 'story writing malayalam ', isStage: false),
              SerDrawerList(text: 'Mudravakya rajana', isStage: false),
              SerDrawerList(text: 'Micro fiction malayalam', isStage: false),
              SerDrawerList(text: 'Caption writing arabic', isStage: false),
              SerDrawerList(text: 'Feature writing', isStage: false),
              SerDrawerList(text: 'Social tweet english  ', isStage: false),
              SerDrawerList(text: 'Sahithya niroopanam', isStage: false),
              SerDrawerList(text: 'Proof reading english ', isStage: false),
              SerDrawerList(text: 'Hadees vyakkana rajana', isStage: false),
              SerDrawerList(text: 'Irthibaq', isStage: false),
              SerDrawerList(text: 'E-poster', isStage: false),
              SerDrawerList(text: 'Calligraphy ', isStage: false),
              SerDrawerList(text: 'Spot magazine', isStage: false),
              SerDrawerList(text: 'Poem translation (eng-mal)', isStage: false),
              SerDrawerList(text: 'Motto making english', isStage: false),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
