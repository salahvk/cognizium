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
              SerDrawerList(text: 'Paper presentation -(usoolul fiqh)'),
              SerDrawerList(text: 'Paper presentation-(quran)'),
              SerDrawerList(text: 'Muathamar '),
              SerDrawerList(text: 'burda aashayavishkaram'),
              SerDrawerList(text: 'Ismul jalala'),
              SerDrawerList(text: 'Thadrees'),
              SerDrawerList(text: 'Aashaya samvadam'),
              SerDrawerList(text: 'Book discussion '),
              SerDrawerList(text: 'Lecturing'),
              SerDrawerList(text: 'Fiqh discussion'),
              SerDrawerList(text: 'Seera parayanam'),
              SerDrawerList(text: 'Burda'),
              SerDrawerList(text: 'Musha’ara'),
              SerDrawerList(text: 'Viplava ganam'),
              SerDrawerList(text: 'Nabiyutharam'),
              SerDrawerList(text: 'Inspiration talk'),
              SerDrawerList(text: 'Panel discussion '),
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
              SerDrawerList(text: 'Pusthaka rajana', isStage: false),
              SerDrawerList(text: 'Magazine', isStage: false),
              SerDrawerList(text: 'Moulid rajana', isStage: false),
              SerDrawerList(text: 'Malappatt rajana', isStage: false),
              SerDrawerList(text: 'Thasneef', isStage: false),
              SerDrawerList(text: 'Research ', isStage: false),
              SerDrawerList(text: 'Project ', isStage: false),
              SerDrawerList(text: 'novel', isStage: false),
              SerDrawerList(text: 'Social tweet (Malayalam)', isStage: false),
              SerDrawerList(text: 'Announcement creation', isStage: false),
              SerDrawerList(text: 'Cartoon', isStage: false),
              SerDrawerList(text: 'Poster designing ', isStage: false),
              SerDrawerList(text: 'Status vedio', isStage: false),
              SerDrawerList(text: 'Dictionary making', isStage: false),
              SerDrawerList(text: 'Typography ', isStage: false),
              SerDrawerList(text: 'Magazine layout ', isStage: false),
              SerDrawerList(text: 'Chumareyutth', isStage: false),
              SerDrawerList(text: 'Counter writing ', isStage: false),
              SerDrawerList(text: 'PPT contest ', isStage: false),
              SerDrawerList(text: 'Digital traveling ', isStage: false),
              SerDrawerList(text: 'Typing', isStage: false),
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
