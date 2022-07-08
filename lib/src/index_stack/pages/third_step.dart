import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/form_provider.dart';

class ThirdStep extends StatelessWidget {
  ThirdStep({Key? key, required this.submit}) : super(key: key);
  final VoidCallback? submit;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FormProvider>(context);
    TextStyle textStyle = const TextStyle(fontSize: 20);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          style: textStyle,
          controller: controller,
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
          validator: (String? val) {
            if (val == null || val.trim().isEmpty) {
              return 'Need your password';
            }
            if (val.length < 3) {
              return 'Password too short';
            }
            return null;
          },
          onSaved: (String? val) {
            data.password = val!;
          },
        ),
        const SizedBox(height: 30.0),
        TextFormField(
          style: textStyle,
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: 'Confirm password',
            hintText: 'Re-enter your password',
          ),
          validator: (String? val) {
            if (controller.text != val) {
              return 'Passwords not match';
            }
            return null;
          },
        ),
        const SizedBox(height: 30.0),
        MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
          color: Colors.indigo,
          textColor: Colors.white,
          onPressed: submit,
          child: Text('SUBMIT', style: textStyle),
        ),
      ],
    );
  }
}
