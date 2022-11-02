import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    Key? key,
    required this.size,
    required this.age,
    required this.text,
  }) : super(key: key);

  final Size size;
  final List<String>? age;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .15,
      height: size.height / 10,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: .1)),
      child: Center(child: SingleChildScrollView(child: Text(text))),
    );
  }
}
