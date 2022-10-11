import 'package:cognizium/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SerDrawerList extends StatefulWidget {
  final String text;
  bool? isStage;
  // GestureTapCallback? onTap;

  SerDrawerList({Key? key, required this.text, this.isStage}) : super(key: key);

  @override
  State<SerDrawerList> createState() => _SerDrawerListState();
}

class _SerDrawerListState extends State<SerDrawerList> {
  bool isTickSelected = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    return SizedBox(
      height: 30,
      child: InkWell(
        onTap: () {
          // if (provider.stage.length == 5) {
          //   return;
          // }
          setState(() {
            isTickSelected = !isTickSelected;
          });
          if (isTickSelected) {
            if (widget.isStage != false) {
              provider.stage.add(widget.text);
            } else if (widget.isStage == false) {
              provider.offStage.add(widget.text);
              // print(provider.offStage);
            }
            // print(provider.stage);
          } else {
            if (widget.isStage != false) {
              provider.stage.contains(widget.text)
                  ? provider.stage.remove(widget.text)
                  : null;
            } else {
              provider.offStage.contains(widget.text)
                  ? provider.offStage.remove(widget.text)
                  : null;
            }

            // print(provider.stage);
            // print(provider.offStage);
          }

          // print(provider.offStage);
        },
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.white10.withAlpha(80)),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withAlpha(70),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  color: Colors.white.withOpacity(0.5),
                ),
                child: isTickSelected ? const Icon(Icons.check) : null,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(widget.text)),
            ],
          ),
        ),
      ),
    );
  }
}
