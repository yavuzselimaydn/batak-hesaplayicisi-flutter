import 'package:flutter/material.dart';

class Sonuc extends StatelessWidget {
  final gelenKey;
  final Map<String,dynamic>? sonuc1,sonuc2,sonuc3;
  const Sonuc({required this.sonuc1,required this.sonuc2, this.sonuc3,required this.gelenKey,super.key});

  List<Map> siralama(Map sonuc1,Map sonuc2,Map sonuc3){
    List<Map> sonuclar = [];
    sonuclar.add(sonuc1);
    sonuclar.add(sonuc2);
    sonuclar.add(sonuc3);
  
    sonuclar.sort(
      (a,b) => b["result"].compareTo(a["result"])
    );
    return sonuclar;
  }


  @override
  Widget build(BuildContext context) {
    var sira = siralama(sonuc1!, sonuc2!, sonuc3!);
    return WillPopScope(                         //donanımsal geri tuslarunı kapattim.
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sonuçlar"),
          automaticallyImplyLeading: false,         //appbardaki geri tusunu kaldırdım
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.all(16),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: ListTile(
                    leading: Text("1.",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    title: Text(sira[0]["name"].toString().toUpperCase(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    trailing: Text(sira[0]["result"].toString(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(16),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: ListTile(
                    leading: Text("2.",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    title: Text(sira[1]["name"].toString().toUpperCase(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    trailing: Text(sira[1]["result"].toString(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ),
                  ),
                ),
                sira[2]["name"].isEmpty ? SizedBox() : Card(
                  margin: EdgeInsets.all(16),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: ListTile(
                    leading: Text("3.",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    title: Text(sira[2]["name"].toString().toUpperCase(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    trailing: Text(sira[2]["result"].toString(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ),
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: () {
                    gelenKey.currentState!.reset();
                    Navigator.pop(context);
                  }, 
                  child:const Text("Yeni Oyun")
                )
              ],
          ),
        ),
      ),
    );
  }
}



