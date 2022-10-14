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
  final cpuController = TextEditingController();
  final ramController = TextEditingController();
  final vgaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Activity Form"),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                          labelText: "Name of the game",
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
                          labelText: "Type of the game",
                          labelStyle: TextStyle(color: Colors.blue)),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: desController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Required disk",
                          labelStyle: TextStyle(color: Colors.blue)),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: cpuController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Required CPU",
                          labelStyle: TextStyle(color: Colors.blue)),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: ramController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Required RAM",
                          labelStyle: TextStyle(color: Colors.blue)),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: vgaController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "Please inform";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Required VGA",
                          labelStyle: TextStyle(color: Colors.blue)),
                      keyboardType: TextInputType.text,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var name = nameController.text;
                            var type = typeController.text;
                            var des = desController.text;
                            var cpu = cpuController.text;
                            var ram = ramController.text;
                            var vga = vgaController.text;
                            Model inputModel =
                                Model(name, type, des, cpu, ram, vga);
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
          ),
        ));
  }
}
