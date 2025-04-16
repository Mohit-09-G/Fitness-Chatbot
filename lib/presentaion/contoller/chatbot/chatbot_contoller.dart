import 'dart:convert';
import 'package:get/get.dart';
import 'package:fitnessbot/config/app_api.dart';
import 'package:http/http.dart' as http;

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatbotContoller extends GetxController {
  final responseText = ''.obs;
  final isLoading = false.obs;
  final messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    super.onInit();

    messages.add(ChatMessage(
      text:
          "Hello, I’m FitBot! 👋 I’m your personal sport assistant. How can I help you?",
      isUser: false,
    ));
  }

  Future<void> sendMessage(String message) async {
    bool messageExists = false;

    for (var chat in messages) {
      if (chat.isUser && chat.text == message) {
        responseText.value += " $message";
        messageExists = true;
        break;
      }
    }

    if (!messageExists) {
      messages.add(ChatMessage(text: message, isUser: true));
    }

    isLoading.value = true;
    responseText.value = '';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {'role': 'user', 'content': message}
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['choices'][0]['message']['content'];
        responseText.value = reply;
        messages.add(ChatMessage(text: reply, isUser: false));
      } else {
        final errorMsg = 'Error: ${response.statusCode}';
        responseText.value = errorMsg;
        messages.add(ChatMessage(text: errorMsg, isUser: false));
      }
    } catch (e) {
      final errorMsg = 'Error: $e';
      responseText.value = errorMsg;
      messages.add(ChatMessage(text: errorMsg, isUser: false));
    } finally {
      isLoading.value = false;
    }
  }
}
