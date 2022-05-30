import 'package:flutter/material.dart';

import 'src/arrow/arrow_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arrow Path Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ArrowHome(),
    );
  }
}
