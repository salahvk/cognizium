import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  List<String> stage = [];
  List offStage = [];

  void stageDate(value) {
    print(stage);
    notifyListeners();
  }
}
