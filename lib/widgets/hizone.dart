import 'package:cognizium/widgets/check_cus_list.dart';
import 'package:flutter/material.dart';

class HizoneProgramsList extends StatelessWidget {
  const HizoneProgramsList({
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
              SerDrawerList(text: 'mappilappattu'),
              SerDrawerList(text: 'arabic song '),
              SerDrawerList(text: 'madh song '),
              SerDrawerList(text: 'poem recitation'),
              SerDrawerList(text: 'group song '),
              SerDrawerList(text: 'swallal ilahu recitation'),
              SerDrawerList(text: 'mathrubhasha'),
              SerDrawerList(text: 'hikayath reading'),
              SerDrawerList(text: 'qawali'),
              SerDrawerList(text: 'debate'),
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
              SerDrawerList(text: 'translation (ara-mal)', isStage: false),
              SerDrawerList(text: 'translation (eng-mal)', isStage: false),
              SerDrawerList(text: 'prabhodhana rekha', isStage: false),
              SerDrawerList(text: 'poem making malayalam ', isStage: false),
              SerDrawerList(text: 'story writing english', isStage: false),
              SerDrawerList(text: 'story writing malayalam ', isStage: false),
              SerDrawerList(text: 'inthibaq', isStage: false),
              SerDrawerList(text: 'slogan writing', isStage: false),
              SerDrawerList(text: 'caption writing ', isStage: false),
              SerDrawerList(text: 'social tweet', isStage: false),
              SerDrawerList(text: 'spot magazine', isStage: false),
              SerDrawerList(text: 'survey tool ', isStage: false),
              SerDrawerList(text: 'water coloring ', isStage: false),
              SerDrawerList(text: 'calligraphy', isStage: false),
              SerDrawerList(text: 'book review ', isStage: false),
              SerDrawerList(text: 'e-poster', isStage: false),
              SerDrawerList(text: 'hivar', isStage: false),
              SerDrawerList(text: 'pencil drawing ', isStage: false),
              SerDrawerList(text: 'poster designing ', isStage: false),
              SerDrawerList(text: 'book test ', isStage: false),
              SerDrawerList(text: 'feature writing ', isStage: false),
              SerDrawerList(text: 'motto making', isStage: false),
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
