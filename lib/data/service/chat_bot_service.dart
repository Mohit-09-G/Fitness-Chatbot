import 'dart:convert';
import 'package:fitnessbot/presentaion/contoller/chatbot/chatbot_contoller.dart';
import 'package:http/http.dart' as http;
import 'package:fitnessbot/config/app_api.dart';

class ChatbotService {
  Future<String> getBotResponse(List<ChatMessage> chatHistory) async {
    try {
      final List<Map<String, String>> messages = [
        {
          'role': 'system',
          'content':
              'You are FitBot, a friendly and knowledgeable fitness assistant. You help users with workout tips, health advice, and motivation. Keep responses short, helpful, and engaging. If a user asks something off-topic, briefly answer then steer back to fitness.'
        },
        ...chatHistory.map((msg) => {
              'role': msg.isUser ? 'user' : 'assistant',
              'content': msg.text,
            }),
      ];

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': messages,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        throw Exception('API Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Request Failed: $e');
    }
  }
}
