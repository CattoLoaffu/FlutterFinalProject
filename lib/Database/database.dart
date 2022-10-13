import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../model/model.dart';

class ModelDatabase {
  String dbName;
  ModelDatabase(this.dbName);

  Future<Database> openDatabase() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDir.path, dbName);

    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> insertData(Model insModel) async {
    // ignore: unnecessary_this
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Expense");

    //javascript object notation
    var keyid = store.add(db, {
      "Name": insModel.name,
      "type": insModel.type,
      "description": insModel.description
    });
    db.close();
    return keyid;
  }

  Future<List<Model>> loadData() async {
    // ignore: unnecessary_this
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Expense");
    var snapshot = await store.find(db);
    List<Model> modelList = [];
    for (var record in snapshot) {
      String name = record["Name"].toString();
      String type = record["type"].toString();
      String description = record["description"].toString();
      modelList.add(Model(name, type, description));
    }
    return modelList;
  }
}
