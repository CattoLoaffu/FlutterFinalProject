import 'package:flutter/foundation.dart';
import 'package:flutter_application_4/model/model.dart';

class TransacProvide with ChangeNotifier {
  List<Model> model = [
    Model("Genshin Impact", "RPG", "30GB"),
    Model("Call of Duty", "Shooting", "80GB")
  ];

  List<Model> getModel() {
    return model;
  }

  void addModel(Model importedModel) {
    model.add(importedModel);
  }
}
