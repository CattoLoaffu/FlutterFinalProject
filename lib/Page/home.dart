import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/Page/formPage.dart';
import 'package:provider/provider.dart';

import '../Provider/transac_provide.dart';
import '../model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Game Data",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FormPage();
                  }));
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Consumer(
          builder: ((context, TransacProvide transacProvide, child) {
            return ListView.builder(
                itemCount: transacProvide.model.length,
                itemBuilder: (BuildContext context, int index) {
                  Model data = transacProvide.model[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(data.name),
                      subtitle: Text(data.type),
                    ),
                  );
                });
          }),
        ));
  }
}
