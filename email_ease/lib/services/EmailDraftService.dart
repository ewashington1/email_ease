import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailDraft {
  final String subject;
  final String body;

  EmailDraft({required this.subject, required this.body});
}

class EmailDraftService {
  Future<EmailDraft> generateEmailDraft(String prompt, String model) async {
    final url = Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions');

    final headers = {
      'Authorization': 'Bearer YOUR_OPEN_AI_KEY', // Replace with your actual key
      'Content-Type': 'application/json'
    };

    // Adjust the prompt based on the model
    String adjustedPrompt;
    switch (model) {
      case 'Business':
        adjustedPrompt = 'Write a professional business email with these main points: ' + prompt;
        break;
      case 'Friendly':
        adjustedPrompt = 'Write a friendly email with these main points: ' + prompt;
        break;
      case 'Casual':
        adjustedPrompt = 'Write a casual email with these main points: ' + prompt;
        break;
      default:
        adjustedPrompt = prompt;
    }

    final body = jsonEncode({
      'prompt': adjustedPrompt,
      'max_tokens': 60,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Assume the subject is the first sentence and the body is the rest
      final text = data['choices'][0]['text'].trim();
      final subjectEndIndex = text.indexOf('.');
      final subject = text.substring(0, subjectEndIndex).trim();
      final body = text.substring(subjectEndIndex + 1).trim();
      return EmailDraft(subject: subject, body: body);
    } else {
      throw Exception('Failed to generate email draft');
    }
  }
}
