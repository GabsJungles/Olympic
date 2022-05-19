import 'package:flutter/material.dart';
import 'package:olympic/pages/initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finding World',
      debugShowCheckedModeBanner: false,
      home: InitalPage(),
    );
  }
}
