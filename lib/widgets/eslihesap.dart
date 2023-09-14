import 'package:batak_hesaplama/pages/sonuc.dart';
import 'package:flutter/material.dart';

class EsliHesap extends StatefulWidget {
  final String grup1,grup2;
  const EsliHesap({required this.grup1,required this.grup2,super.key});

  @override
  State<EsliHesap> createState() => _EsliHesapState();
}

class _EsliHesapState extends State<EsliHesap> {
  late Map<String,dynamic> sonuc1 = {};
  late Map<String,dynamic> sonuc2 = {};
  late Map<String,dynamic> sonuc3 = {};


  int tur = 1;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    sonuc1 = {"name": widget.grup1, "result": 0};
    sonuc2 = {"name": widget.grup2, "result": 0};
    sonuc3= {"name":"","result":0};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eşli İhaleli Batak"),
      ),
      body: ListView(
          children: [
            Form(
              key: _formKey,
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
                      //initialValue: "1",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: widget.grup1,
                          hintText: widget.grup1,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: tur >= 1 && tur %2 == 1 ? Colors.red : Colors.grey.shade400 ,
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
                      //initialValue: "1",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: widget.grup2,
                          hintText: widget.grup2,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: tur >= 2 && tur %2 == 0 ? Colors.red : Colors.grey.shade400 ,
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
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if(tur<11){
                            _formKey.currentState!.save();
                            _formKey.currentState!.reset();
                            setState(() {
                              tur += 1;
                            });
                          }
                          else{
                            _formKey.currentState!.save();
                            _formKey.currentState!.reset();
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sonuc(sonuc1: sonuc1, sonuc2: sonuc2,sonuc3: sonuc3,gelenKey:_formKey ,))
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
            )
          ],
      )
    );
  }
}