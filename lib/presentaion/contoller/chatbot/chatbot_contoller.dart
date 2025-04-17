import 'package:fitnessbot/data/service/chat_bot_service.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatbotController extends GetxController {
  final responseText = ''.obs;
  final isLoading = false.obs;
  final messages = <ChatMessage>[].obs;
  final ChatbotService _chatbotService = ChatbotService();

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
    // Prevent duplicate user messages
    bool messageExists =
        messages.any((msg) => msg.isUser && msg.text == message);

    if (!messageExists) {
      messages.add(ChatMessage(text: message, isUser: true));
    } else {
      responseText.value += " $message";
    }

    isLoading.value = true;
    responseText.value = '';

    try {
      final reply = await _chatbotService.getBotResponse(messages.toList());
      responseText.value = reply;
      messages.add(ChatMessage(text: reply, isUser: false));
    } catch (e) {
      final errorMsg = e.toString();
      responseText.value = errorMsg;
      messages.add(ChatMessage(text: errorMsg, isUser: false));
    } finally {
      isLoading.value = false;
    }
  }
}
