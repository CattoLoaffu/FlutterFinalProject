// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_4/Page/form_edit.dart';
import 'package:flutter_application_4/Provider/transac_provide.dart';
import 'package:flutter_application_4/model/model.dart';
import 'package:provider/provider.dart';

class FormDataScreen extends StatefulWidget {
  final Model data;

  //Controller

  const FormDataScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<FormDataScreen> createState() => _FormDataScreenState();
}

class _FormDataScreenState extends State<FormDataScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final desController = TextEditingController();
  final cpuController = TextEditingController();
  final ramController = TextEditingController();
  final vgaController = TextEditingController();

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    typeController.text = widget.data.type.toString();
    desController.text = widget.data.description.toString();
    cpuController.text = widget.data.cpu.toString();
    ramController.text = widget.data.ram.toString();
    vgaController.text = widget.data.vga.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Game Info"),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: ListTile(
                        title: Text("Name : ${nameController.text}"),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: ListTile(
                        title: Text("type : ${typeController.text}"),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: ListTile(
                        title: Text("Requied CPU : ${cpuController.text}"),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: ListTile(
                        title: Text("Requird RAM : ${ramController.text}"),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: ListTile(
                        title: Text("Requird VGA : ${vgaController.text}"),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: ListTile(
                        title: Text("Requird disk : ${desController.text}"),
                      ),
                    ),
                    ElevatedButton(
                        child: const Text("Edit Data"),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FormEditScreen(
                              data: Model(
                                  nameController.text,
                                  typeController.text,
                                  desController.text,
                                  cpuController.text,
                                  ramController.text,
                                  vgaController.text),
                            );
                          }));
                        })
                  ],
                ),
              )),
        ));
  }
}
