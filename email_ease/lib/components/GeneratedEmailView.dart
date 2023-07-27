import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneratedEmailView extends StatefulWidget {
  GeneratedEmailView({
    Key? key,
    required this.emailSubject,
    required this.emailBody,
  }) : super(key: key);

  final String emailSubject;
  final String emailBody;

  @override
  _GeneratedEmailViewState createState() => _GeneratedEmailViewState();
}

class _GeneratedEmailViewState extends State<GeneratedEmailView> {
  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(new ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to Clipboard'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Subject'),
          subtitle: Text(widget.emailSubject),
          trailing: IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              _copyToClipboard(widget.emailSubject, context);
            },
          ),
        ),
        ListTile(
          title: Text('Body'),
          subtitle: Text(widget.emailBody),
          trailing: IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              _copyToClipboard(widget.emailBody, context);
            },
          ),
        ),
      ],
    );
  }
}
