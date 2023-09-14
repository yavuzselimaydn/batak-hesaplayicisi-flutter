import 'package:batak_hesaplama/widgets/eslihesap.dart';
import 'package:flutter/material.dart';

class Ihaleli extends StatefulWidget {
  const Ihaleli({super.key});

  @override
  State<Ihaleli> createState() => _IhaleliState();
}

class _IhaleliState extends State<Ihaleli> {
  String grup1 = "";
  String grup2 = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Eşli İhaleli Batak"),
        ),
        body: ListView(children: [
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "1. Grup İsmi",
                          labelText: "1. Grup İsmi",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Grup ismini giriniz";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        grup1 = newValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "2. Grup İsmi",
                          labelText: "2. Grup İsmi",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Grup ismini giriniz";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        grup2 = newValue!;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => EsliHesap(grup1: grup1, grup2: grup2)
                          )
                        );
                      }
                    }, 
                    child: const Text("Devam")
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
