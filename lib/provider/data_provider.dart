import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  List<String> stage = [];
  List offStage = [];
  List<String> gstage = [];
  List<String> goffstage = [];

  cleanList() {
    stage.clear();
    offStage.clear();
    gstage.clear();
    goffstage.clear();
    notifyListeners();

    print('stage printed');
    print(stage);
    print(offStage);
    print(gstage);
    print(goffstage);
  }
}
