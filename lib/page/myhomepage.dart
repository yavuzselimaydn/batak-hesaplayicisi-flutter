import 'package:batak_hesaplama/page/esli.dart';
import 'package:batak_hesaplama/page/uckisi.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Batak Hesaplayıcı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                width: 200,
                height : 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("images/foto.jpg")),
                  borderRadius: BorderRadiusDirectional.circular(36),
                  border: Border.all(
                      width: 4,
                      color: Colors.red
                  )
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UcKisi() 
                  )
                );
              },
            ),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                "3 kişi İhaleli Batak",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                width: 200,
                height : 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("images/foto.jpg")),
                  borderRadius: BorderRadiusDirectional.circular(36),
                  border: Border.all(
                      width: 4,
                      color: Colors.black
                  )
                )
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:  (context) =>const Ihaleli(),
                  )
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Eşli İhaleli Batak",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}