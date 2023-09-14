
import 'package:batak_hesaplama/pages/myhomepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
