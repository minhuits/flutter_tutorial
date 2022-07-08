import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/first_step.dart';
import 'pages/second_step.dart';
import 'pages/third_step.dart';
import 'provider/form_provider.dart';
import 'step_button.dart';

class IndexStackPage extends StatefulWidget {
  const IndexStackPage({Key? key}) : super(key: key);

  @override
  State<IndexStackPage> createState() => _IndexStackPageState();
}

class _IndexStackPageState extends State<IndexStackPage> {
  int selectedStack = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController dateController = TextEditingController();

  AlertDialog alertDialog() {
    final inputData = Provider.of<FormProvider>(context);
    var padding = const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0);

    return AlertDialog(
      title: const Text('Your Input'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.grey.shade100,
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('name: ${inputData.name}'),
                Text('email: ${inputData.email}'),
                Text('gender: ${inputData.gender}'),
                Text('birthday: ${inputData.dateOfBirth}'),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'You got 100',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            inputData.name = '';
            inputData.email = '';
            inputData.gender = 'Male';
            inputData.dateOfBirth = '';
            inputData.password = '';

            Navigator.of(context).pop(true);
          },
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('CANCEL'),
        ),
      ],
    );
  }

  void submit() async {
    FormState fromState = _formKey.currentState!;

    setState(() => autoValidateMode = AutovalidateMode.onUserInteraction);

    // 통과하지 못하면
    if (!fromState.validate()) {
      return;
    }

    // 저장
    fromState.save();

    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => alertDialog(),
    );

    if (result) {
      fromState.reset();
      dateController.text = '';
      setState(() => autoValidateMode = AutovalidateMode.disabled);
    }
  }

  @override
  Widget build(BuildContext context) {
    var padding = const EdgeInsets.symmetric(horizontal: 30.0);

    return Scaffold(
      appBar: AppBar(title: const Text('Indexed Stack')),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green.shade200,
              width: double.infinity,
              height: 60,
              child: const Align(
                child: Text(
                  'Check Your Luck',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              autovalidateMode: autoValidateMode,
              child: Expanded(
                child: IndexedStack(
                  index: selectedStack,
                  children: <Widget>[
                    Container(padding: padding, child: const FirstStep()),
                    Container(
                        padding: padding,
                        child: SecondStep(dateController: dateController)),
                    Container(
                      padding: padding,
                      child: ThirdStep(submit: submit),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.indigo,
              width: double.infinity,
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  StepButton(
                    selected: selectedStack == 0,
                    step: '1',
                    onPressed: () => setState(() => selectedStack = 0),
                  ),
                  StepButton(
                    selected: selectedStack == 1,
                    step: '2',
                    onPressed: () => setState(() => selectedStack = 1),
                  ),
                  StepButton(
                    selected: selectedStack == 2,
                    step: '3',
                    onPressed: () => setState(() => selectedStack = 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
