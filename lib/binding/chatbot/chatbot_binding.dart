import 'package:fitnessbot/di/injection.dart';
import 'package:fitnessbot/presentaion/contoller/chatbot/chatbot_contoller.dart';
import 'package:get/get.dart';

class ChatbotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatbotContoller>(() => getIt<ChatbotContoller>());
  }
}
