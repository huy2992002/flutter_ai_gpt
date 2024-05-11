import 'dart:convert';

import 'package:flutter_ai_gpt/constants/ag_constants.dart';
import 'package:flutter_ai_gpt/constants/ag_text.dart';
import 'package:http/http.dart' as http;

abstract class IMessageServices {
  Future<String> postQuestion(String question);
}

class MessageServices implements IMessageServices {
  @override
  Future<String> postQuestion(String question) async {
    final url = AGConstants.endPointChat;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${AGConstants.token}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "conversation_id": AGConstants.conversationId,
          "bot_id": AGConstants.botId,
          "user": AGConstants.userId,
          "query": question,
          "stream": false
        }),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (data['msg'] == 'success') {
        String answer = (data['messages'] as List<dynamic>)[0]['content'];
        return answer;
      }
      throw Exception();
    } catch (e) {
      throw Exception(AGText.errorInternet);
    }
  }
}
