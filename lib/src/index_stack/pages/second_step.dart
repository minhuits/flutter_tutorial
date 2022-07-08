import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/form_provider.dart';

class SecondStep extends StatefulWidget {
  const SecondStep({Key? key, required this.dateController}) : super(key: key);

  final TextEditingController dateController;

  @override
  State<SecondStep> createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FormProvider>(context);
    // var data = inputData.model;
    TextStyle textStyle = const TextStyle(fontSize: 20);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          isExpanded: true,
          elevation: 12,
          itemHeight: kMinInteractiveDimension + 10,
          underline: Container(
            height: 2.0,
            color: Colors.grey[400],
          ),
          items: ['Male', 'Female']
              .map<DropdownMenuItem<String>>(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(value, style: textStyle),
                  ),
                ),
              )
              .toList(),
          value: data.gender,
          onChanged: (String? value) => setState(() => data.gender = value!),
        ),
        const SizedBox(height: 30.0),
        GestureDetector(
          onTap: () async {
            final birthday = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1920),
              lastDate: DateTime.now(),
              initialDatePickerMode: DatePickerMode.year,
            );
            if (birthday != null) {
              data.dateOfBirth = birthday.toString().split(' ')[0];
              widget.dateController.text = data.dateOfBirth;
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: widget.dateController,
              style: textStyle,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                labelText: 'Birth Date',
              ),
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return 'Need your birthday';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
