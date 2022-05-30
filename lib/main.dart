import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/arrow.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arrow Path Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: const Text('Arrow Path Example')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            itemCount: 6,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 2),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.only(top: 20),
                color: Colors.white,
                width: double.maxFinite,
                height: 110,
                child: CustomPaint(
                  foregroundPainter: ArrowPainter2(),
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '오늘의 일정',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
