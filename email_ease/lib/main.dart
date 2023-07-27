import 'package:flutter/material.dart';
import 'package:email_ease/components/TitleView.dart';
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

  void _onEmailGenerated(String subject, String body) {
    setState(() {
      _emailSubject = subject;
      _emailBody = body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
        children: <Widget>[
          InputFieldView(
              userInput: _userInput,
              onUserInputChanged: _onUserInputChanged,
            ),
          SizedBox(height: 10),
          EmailTypePickerView(
            emailType: _emailType,
            onEmailTypeChanged: _onEmailTypeChanged,
          ),
          SizedBox(height: 10),
          GenerateButtonView(
            userInput: _userInput,
            emailType: _emailType,
            onEmailGenerated: _onEmailGenerated,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(bottom: 16),  // More padding at the bottom
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),  // Mediumly rounded edges
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.05,
                  blurRadius: 1,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: GeneratedEmailView(
              emailSubject: _emailSubject,
              emailBody: _emailBody,
            ),
          ),
        ],
      ),
    );
  }
}
