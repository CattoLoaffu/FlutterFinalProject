import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Activity Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.people,
                      color: Colors.blue,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.blue)),
                autofocus: true,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    labelText: "Type",
                    labelStyle: TextStyle(color: Colors.blue)),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Description"),
              ),
              ElevatedButton(
                  onPressed: () {},
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
