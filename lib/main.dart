import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/freezd/freezd_page.dart';
import 'src/index_stack/provider/form_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FormProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const FreezdPage(),
      ),
    );
  }
}
