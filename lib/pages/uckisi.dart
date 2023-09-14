import 'package:batak_hesaplama/widgets/uckisihesap.dart';
import 'package:flutter/material.dart';

class UcKisi extends StatefulWidget {
  const UcKisi({super.key});

  @override
  State<UcKisi> createState() => _UcKisiState();
}

class _UcKisiState extends State<UcKisi> {
  String isim_1="" ,isim_2="",isim_3="";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("3 Kişi İhaleli Batak"),
        ),
        body: ListView(children: [
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextFormField(
                      //initialValue: "amet",
                      decoration: const InputDecoration(
                          labelText: "1. Oyuncu",
                          hintText: "1. Oyuncu İsmini Giriniz",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Lütfen 1. oyuncu ismini giriniz.";
                        }else{
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        isim_1 = newValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextFormField(
                      //initialValue: "yavuz",
                      decoration: const InputDecoration(
                          labelText: "2. Oyuncu",
                          hintText: "2. Oyuncu İsmini Giriniz",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Lütfen 2. oyuncu ismini giriniz.";
                        }else{
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        isim_2 = newValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextFormField(
                      //initialValue: "murat",
                      decoration: const InputDecoration(
                          labelText: "3. Oyuncu",
                          hintText: "3. Oyuncu İsmini Giriniz",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Lütfen 3. oyuncu ismini giriniz.";
                        }else{
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        isim_3 = newValue!;
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
                            builder: (context) => UcKisiHesap(isim_1: isim_1,isim_2: isim_2, isim_3: isim_3,), 
                          )
                        );
                      }
                    }, 
                    child:const Text("Devam")
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
