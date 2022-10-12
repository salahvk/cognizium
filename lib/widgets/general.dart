import 'package:cognizium/widgets/check_cus_list.dart';
import 'package:flutter/material.dart';

class GeneralProgramsList extends StatelessWidget {
  const GeneralProgramsList({
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
              SerDrawerList(
                  text: 'Paper presentation -(usoolul fiqh)', isgeneral: true),
              SerDrawerList(
                  text: 'Paper presentation-(quran)', isgeneral: true),
              SerDrawerList(text: 'Muathamar ', isgeneral: true),
              SerDrawerList(text: 'burda aashayavishkaram', isgeneral: true),
              SerDrawerList(text: 'Ismul jalala', isgeneral: true),
              SerDrawerList(text: 'Thadrees', isgeneral: true),
              SerDrawerList(text: 'Aashaya samvadam', isgeneral: true),
              SerDrawerList(text: 'Book discussion ', isgeneral: true),
              SerDrawerList(text: 'Lecturing', isgeneral: true),
              SerDrawerList(text: 'Fiqh discussion', isgeneral: true),
              SerDrawerList(text: 'Seera parayanam', isgeneral: true),
              SerDrawerList(text: 'Burda', isgeneral: true),
              SerDrawerList(text: 'Musha’ara', isgeneral: true),
              SerDrawerList(text: 'Viplava ganam', isgeneral: true),
              SerDrawerList(text: 'Nabiyutharam', isgeneral: true),
              SerDrawerList(text: 'Inspiration talk', isgeneral: true),
              SerDrawerList(text: 'Panel discussion ', isgeneral: true),
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
              SerDrawerList(
                  text: 'Pusthaka rajana', isStage: false, isgeneral: true),
              SerDrawerList(text: 'Magazine', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Moulid rajana', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Malappatt rajana', isStage: false, isgeneral: true),
              SerDrawerList(text: 'Thasneef', isStage: false, isgeneral: true),
              SerDrawerList(text: 'Research ', isStage: false, isgeneral: true),
              SerDrawerList(text: 'Project ', isStage: false, isgeneral: true),
              SerDrawerList(text: 'novel', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Social tweet (Malayalam)',
                  isStage: false,
                  isgeneral: true),
              SerDrawerList(
                  text: 'Announcement creation',
                  isStage: false,
                  isgeneral: true),
              SerDrawerList(text: 'Cartoon', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Poster designing ', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Status vedio', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Dictionary making', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Typography ', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Magazine layout ', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Chumareyutth', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Counter writing ', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'PPT contest ', isStage: false, isgeneral: true),
              SerDrawerList(
                  text: 'Digital traveling ', isStage: false, isgeneral: true),
              SerDrawerList(text: 'Typing', isStage: false, isgeneral: true),
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
