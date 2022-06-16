import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'arrow2.dart';

class ArrowHome extends StatefulWidget {
  const ArrowHome({Key? key}) : super(key: key);

  @override
  State<ArrowHome> createState() => _ArrowHomeState();
}

class _ArrowHomeState extends State<ArrowHome> {
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
      backgroundColor: Colors.grey,
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
                width: double.infinity,
                height: 80,
                child: CustomPaint(
                  foregroundPainter: ArrowPainter2(color: Colors.blueAccent),
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '오늘의 일정',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
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
