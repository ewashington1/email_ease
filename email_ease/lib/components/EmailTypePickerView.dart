import 'package:flutter/material.dart';

class EmailTypePickerView extends StatelessWidget {
  final String emailType;
  final ValueChanged<String?> onEmailTypeChanged;

  const EmailTypePickerView({Key? key, required this.emailType, required this.onEmailTypeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: DropdownButton<String>(
          value: emailType,
          onChanged: onEmailTypeChanged,
          items: <String>['Business', 'Friendly', 'Casual'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
