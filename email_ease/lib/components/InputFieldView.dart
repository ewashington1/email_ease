import 'package:flutter/material.dart';

class InputFieldView extends StatelessWidget {
  final String userInput;
  final ValueChanged<String> onUserInputChanged;

  const InputFieldView({
    Key? key,
    required this.userInput,
    required this.onUserInputChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onUserInputChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter main points',
      ),
      maxLines: 5,
      textInputAction: TextInputAction.done,
    );
  }
}
