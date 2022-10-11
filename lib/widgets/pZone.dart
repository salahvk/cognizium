import 'package:cognizium/widgets/check_cus_list.dart';
import 'package:flutter/material.dart';

class PzoneProgramsList extends StatelessWidget {
  const PzoneProgramsList({
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
              SerDrawerList(text: 'Prasangam'),
              SerDrawerList(text: 'Elocution '),
              SerDrawerList(text: 'Quthuba'),
              SerDrawerList(text: 'Thaqreer'),
              SerDrawerList(text: 'Quran prabashanam'),
              SerDrawerList(text: 'Ext-ember'),
              SerDrawerList(text: 'Aadarsha samarthanam'),
              SerDrawerList(text: 'Thidkar'),
              SerDrawerList(text: 'Muhavara'),
              SerDrawerList(text: 'Madh song'),
              SerDrawerList(text: 'Arabi song '),
              SerDrawerList(text: 'Quiz'),
              SerDrawerList(text: 'Poem recitation'),
              SerDrawerList(text: 'News bulletin '),
              SerDrawerList(text: 'Hadees competition '),
              SerDrawerList(text: 'Ibarath vayana'),
              SerDrawerList(text: 'Kithab quiz'),
              SerDrawerList(text: 'Spot ma’sala'),
              SerDrawerList(text: 'Quthubathul jumu’a'),
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
              SerDrawerList(text: 'Prabandham', isStage: false),
              SerDrawerList(text: 'Essay ', isStage: false),
              SerDrawerList(text: 'Mazmoon', isStage: false),
              SerDrawerList(text: 'Maqala', isStage: false),
              SerDrawerList(text: 'Slogan writing ', isStage: false),
              SerDrawerList(
                  text: 'Translation (arabi,english)', isStage: false),
              SerDrawerList(
                  text: 'Translation (malayalam,urdu)', isStage: false),
              SerDrawerList(text: 'Madh gana rajana', isStage: false),
              SerDrawerList(text: 'Kavitha rajana ', isStage: false),
              SerDrawerList(text: 'Poem making ', isStage: false),
              SerDrawerList(text: 'Manlooma', isStage: false),
              SerDrawerList(text: 'Story writing  ', isStage: false),
              SerDrawerList(text: 'Minikkadha', isStage: false),
              SerDrawerList(text: 'Quran vyakkana rajana', isStage: false),
              SerDrawerList(text: 'Social tweet arabic', isStage: false),
              SerDrawerList(text: 'Kithab review ', isStage: false),
              SerDrawerList(text: 'Sahithya niroopanam', isStage: false),
              SerDrawerList(text: 'Calligraphy', isStage: false),
              SerDrawerList(text: 'Digital designing ', isStage: false),
              SerDrawerList(text: 'Spot magazine', isStage: false),
              SerDrawerList(text: 'Feature writing ', isStage: false),
              SerDrawerList(text: 'Proof reading arabic', isStage: false),
              SerDrawerList(text: 'Moto making arabic', isStage: false),
              SerDrawerList(text: 'Survey tool', isStage: false),
              SerDrawerList(text: 'Viplava gana rajana', isStage: false),
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
