import 'package:flutter/material.dart';

import 'pages/pages.dart';

class FreezdPage extends StatelessWidget {
  const FreezdPage({Key? key}) : super(key: key);

  push(BuildContext context, Widget child) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => child),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(title: Text('Freezd Page', style: textStyle)),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => push(context, const FreezdUserPage()),
              child: Text('Freezd User Page', style: textStyle),
            ),
            ElevatedButton(
              onPressed: () => push(context, const FreezdEventPage()),
              child: Text('Freezd Event Page', style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
