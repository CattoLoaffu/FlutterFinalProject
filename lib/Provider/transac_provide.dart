import 'package:flutter/foundation.dart';
import 'package:flutter_application_4/Database/database.dart';
import 'package:flutter_application_4/model/model.dart';

class TransacProvide with ChangeNotifier {
  List<Model> model = [];

  List<Model> getModel() {
    return model;
  }

  void initData() async {
    var db = ModelDatabase("model.db");
    model = await db.loadData();
    notifyListeners();
  }

  void addModel(Model importedModel) async {
    var db = ModelDatabase("model.db");
    await db.insertData(importedModel);

    model = await db.loadData();
    notifyListeners();
  }
}
