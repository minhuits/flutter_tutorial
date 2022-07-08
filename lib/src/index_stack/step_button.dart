import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  const StepButton({
    Key? key,
    required this.selected,
    required this.step,
    required this.onPressed,
  }) : super(key: key);

  final bool selected;
  final String step;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: selected ? Colors.teal : Colors.white,
      minWidth: 50.0,
      elevation: 10.0,
      onPressed: onPressed,
      child: Text(
        step,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: selected ? Colors.white : Colors.indigo,
        ),
      ),
    );
  }
}
