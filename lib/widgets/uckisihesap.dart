import 'package:batak_hesaplama/pages/sonuc.dart';
import 'package:flutter/material.dart';

class UcKisiHesap extends StatefulWidget {
  final String isim_1, isim_2, isim_3;
  const UcKisiHesap(
      {required this.isim_1,
      required this.isim_2,
      required this.isim_3,
      super.key});

  @override
  State<UcKisiHesap> createState() => _UcKisiHesapState();
}

class _UcKisiHesapState extends State<UcKisiHesap> {
  late Map<String,dynamic> sonuc1 = {};
  late Map<String,dynamic> sonuc2 = {};
  late Map<String,dynamic> sonuc3 = {};

  int tur = 1;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    sonuc1 = {"name": widget.isim_1, "result": 0};
    sonuc2 = {"name": widget.isim_2, "result": 0};
    sonuc3 = {"name": widget.isim_3, "result": 0};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("3 Kişi İhaleli Batak")),
      body: Center(
        child: ListView(children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Text(
                  "$tur. Tur",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextFormField(
                    //initialValue: "3",
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: widget.isim_1,
                        hintText: widget.isim_1,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: tur >= 1 && tur %3 == 1 ? Colors.red : Colors.grey.shade400 ,
                            width: 2
                          )
                        )
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Sonucu giriniz.";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      sonuc1["result"] += int.parse(newValue!);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextFormField(
                    //initialValue: "4",
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: widget.isim_2,
                        hintText: widget.isim_2,
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: tur >= 2 && tur % 3 == 2 ? Colors.red : Colors.grey.shade400 ,
                            width: 2 
                          )
                        )
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Sonucu giriniz.";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      sonuc2["result"] += int.parse(newValue!);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextFormField(
                    //initialValue: "5",
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: widget.isim_3,
                        hintText: widget.isim_3,
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: tur >= 3 && tur % 3 == 0 ? Colors.red : Colors.grey.shade400 ,
                            width: 2 
                          )
                        )
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Sonucu giriniz.";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      sonuc3["result"] += int.parse(newValue!);
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if(tur<11){
                          formKey.currentState!.save();
                          formKey.currentState!.reset();
                          setState(() {
                            tur += 1;
                          });
                        }
                        else{
                          formKey.currentState!.save();
                          formKey.currentState!.reset();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sonuc(sonuc1: sonuc1, sonuc2: sonuc2,sonuc3: sonuc3,gelenKey: formKey,))
                          ).then((value) {
                            setState(() {
                              sonuc1["result"] = 0;
                              sonuc2["result"] = 0;
                              sonuc3["result"] = 0;
                              tur = 1;
                            });
                          });
                        }
                      }
                    },
                    child: Text(
                      tur == 11 ? "Sonuçlar" : "Sonraki Tur"
                    )
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
