import 'package:flutter/material.dart';
import 'package:email_ease/services/EmailDraftService.dart';

class GenerateButtonView extends StatelessWidget {
  GenerateButtonView({
    Key? key,
    required this.userInput,
    required this.emailType,
    required this.onEmailGenerated,
  }) : super(key: key);

  final String userInput;
  final String emailType;
  final Function(String, String) onEmailGenerated;  // Now receives two arguments

  final EmailDraftService _emailDraftService = EmailDraftService();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          final draft = await _emailDraftService.generateEmailDraft(userInput, emailType);
          onEmailGenerated(draft.subject, draft.body);  // Call the callback with two arguments
        } catch (e) {
          print(e); // Log the error
          final dummySubject = 'Dummy Subject';
          final dummyBody = 'Dear [Recipient],\n\nThis is a placeholder email text.\n\nBest,\n[Your Name]';
          onEmailGenerated(dummySubject, dummyBody); // Provide the dummy email
        }
      },
      child: Text('Generate Email'),
    );
  }
}
