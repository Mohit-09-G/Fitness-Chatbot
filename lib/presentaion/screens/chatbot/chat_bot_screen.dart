import 'package:fitnessbot/config/app_images.dart';
import 'package:fitnessbot/presentaion/contoller/chatbot/chatbot_contoller.dart';
import 'package:fitnessbot/presentaion/screens/chatbot/widgets/chatAppbar.dart';
import 'package:fitnessbot/presentaion/screens/chatbot/widgets/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotScreen extends StatelessWidget {
  ChatBotScreen({super.key});

  final ChatbotContoller chatbotContoller = Get.put(ChatbotContoller());
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Chatappbar(),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => _scrollToBottom());
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(12),
                  itemCount: chatbotContoller.messages.length,
                  itemBuilder: (context, index) {
                    final msg = chatbotContoller.messages[index];
                    return Align(
                      alignment: msg.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: msg.isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!msg.isUser)
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF2F8FF)),
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                AppImages.cchatbot,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: msg.isUser
                                    ? const Color(0xffF2F8FF)
                                    : const Color(0xffF2F4F5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(msg.isUser ? 20 : 0),
                                  topRight:
                                      Radius.circular(msg.isUser ? 20 : 20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight:
                                      Radius.circular(msg.isUser ? 0 : 20),
                                ),
                              ),
                              child: Text(
                                msg.text,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: msg.isUser
                                      ? const Color(0xff006BE5)
                                      : const Color(0xff303437),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            if (chatbotContoller.isLoading.value)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Textfiled(),
            ),
          ],
        ),
      ),
    );
  }
}
