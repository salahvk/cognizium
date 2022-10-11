import 'package:cognizium/components/color_manager.dart';
import 'package:cognizium/components/styles_manager.dart';
import 'package:flutter/material.dart';

class ZoneTitle extends StatelessWidget {
  String? title1;
  String? title2;
  ZoneTitle({Key? key, required this.title1, required this.title2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title1!,
          style: getBoldtStyle(color: ColorManager.black, fontSize: 20),
        ),
        Text(
          title2!,
          style: getBoldtStyle(color: ColorManager.black, fontSize: 20),
        ),
      ],
    );
  }
}
