import 'package:flutter/material.dart';
import 'package:flutter_application_4/Page/dataInfo.dart';
import 'package:flutter_application_4/Page/formPage.dart';
import 'package:flutter_application_4/Page/form_edit.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransacProvide>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "Game PC Data",
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
            var len = transacProvide.model.length;
            if (len == 0) {
              return const Center(
                child: Text("NO DATA"),
              );
            } else {
              return ListView.builder(
                  itemCount: transacProvide.model.length,
                  itemBuilder: (BuildContext context, int index) {
                    Model data = transacProvide.model[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: ListTile(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FormDataScreen(
                                data: data,
                              );
                            }));
                          },
                          leading: CircleAvatar(
                            child: FittedBox(
                              child: Text(data.description),
                            ),
                          ),
                          title: Text(data.name),
                          subtitle: Text(data.type),
                          trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // call provider
                                var provider = Provider.of<TransacProvide>(
                                    context,
                                    listen: false);
                                provider.deleteModel(data);
                              })),
                    );
                  });
            }
          }),
        ));
  }
}
