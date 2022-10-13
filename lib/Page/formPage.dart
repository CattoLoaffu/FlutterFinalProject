// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Provider/transac_provide.dart';
import 'package:flutter_application_4/model/model.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Activity Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    validator: (String? str) {
                      if (str!.isEmpty) {
                        return "Please inform a name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.blue)),
                    autofocus: true,
                  ),
                  TextFormField(
                    controller: typeController,
                    validator: (String? str) {
                      if (str!.isEmpty) {
                        return "Please inform a type";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        labelText: "Type",
                        labelStyle: TextStyle(color: Colors.blue)),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: desController,
                    validator: (String? str) {
                      if (str!.isEmpty) {
                        return "Please inform a Description";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        labelText: "Description",
                        labelStyle: TextStyle(color: Colors.blue)),
                    keyboardType: TextInputType.text,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var name = nameController.text;
                          var type = typeController.text;
                          var des = desController.text;
                          Model inputModel = Model(name, type, des);
                          var provider = Provider.of<TransacProvide>(context,
                              listen: false);
                          provider.addModel(inputModel);
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.amber)),
                      child: const Text(
                        "Submit",
                      ))
                ],
              )),
        ));
  }
}
