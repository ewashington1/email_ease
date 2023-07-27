import 'package:flutter/material.dart';
// import 'package:email_ease/components/TitleView.dart';
import 'package:email_ease/components/InputFieldView.dart';
import 'package:email_ease/components/EmailTypePickerView.dart';
import 'package:email_ease/components/GenerateButtonView.dart';
import 'package:email_ease/components/GeneratedEmailView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmailEase: AI Drafter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmailDrafterPage(title: 'EmailEase: AI Drafter'),
    );
  }
}

class EmailDrafterPage extends StatefulWidget {
  EmailDrafterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _EmailDrafterPageState createState() => _EmailDrafterPageState();
}

class _EmailDrafterPageState extends State<EmailDrafterPage> {
  String _userInput = '';
  String _emailType = 'Business';
  String _emailSubject = '';
  String _emailBody = '';

  void _onUserInputChanged(String userInput) {
    setState(() {
      _userInput = userInput;
    });
  }

  void _onEmailTypeChanged(String? emailType) {
    setState(() {
      _emailType = emailType ?? 'Business';
    });
  }

  void _onEmailGenerated(String subject, String body) { // Now takes two arguments
    setState(() {
      _emailSubject = subject; // Assign the subject
      _emailBody = body; // Assign the body
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          InputFieldView(
            userInput: _userInput,
            onUserInputChanged: _onUserInputChanged,
          ),
          EmailTypePickerView(
            emailType: _emailType,
            onEmailTypeChanged: _onEmailTypeChanged,
          ),
          GenerateButtonView(
            userInput: _userInput,
            emailType: _emailType,
            onEmailGenerated: _onEmailGenerated, // Passes the function that accepts two arguments
          ),
          GeneratedEmailView(
            emailSubject: _emailSubject,
            emailBody: _emailBody,
          ),
        ],
      ),
    );
  }
}
