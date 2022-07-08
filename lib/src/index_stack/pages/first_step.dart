import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import '../provider/form_provider.dart';

class FirstStep extends StatelessWidget {
  const FirstStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<FormProvider>(context);
    TextStyle textStyle = const TextStyle(fontSize: 20);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          style: textStyle,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            labelText: 'Name',
            hintText: 'Enter your name',
          ),
          validator: (String? val) {
            if (val == null || val.trim().isEmpty) {
              return 'Need your name';
            }
            if (val.length < 2) {
              return 'Name too short';
            }
            return null;
          },
          onSaved: (String? val) {
            data.name = val!;
          },
        ),
        const SizedBox(height: 30.0),
        TextFormField(
          style: textStyle,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: 'Email',
            hintText: 'Enter your email',
          ),
          validator: (String? val) {
            if (!isEmail(val!)) {
              return 'Invalid email';
            }
            return null;
          },
          onSaved: (val) {
            data.email = val!;
          },
        ),
      ],
    );
  }
}
