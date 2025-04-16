import 'package:fitnessbot/config/app_images.dart';
import 'package:fitnessbot/presentaion/contoller/chatbot/chatbot_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Textfiled extends StatefulWidget {
  const Textfiled({super.key});

  @override
  State<Textfiled> createState() => _TextfiledState();
}

class _TextfiledState extends State<Textfiled> {
  final ChatbotController chatbotContoller = Get.put(ChatbotController());

  final TextEditingController inputController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: _focusNode,
            controller: inputController,
            onTap: () {},
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              suffixIcon: Icon(
                Icons.mic_none,
                color: Color(0xff72777A),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff72777A)),
                borderRadius: BorderRadius.all(Radius.circular(48)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff72777A)),
                borderRadius: BorderRadius.all(Radius.circular(48)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff72777A)),
                borderRadius: BorderRadius.all(Radius.circular(48)),
              ),
              hintText: "Type your message",
              hintStyle: TextStyle(fontSize: 16, height: 0),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            final message = inputController.text.trim();
            if (message.isNotEmpty) {
              chatbotContoller.sendMessage(message);
              inputController.clear();
              _focusNode.requestFocus();
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff303437),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              AppImages.sed,
              height: 30,
              width: 30,
            ),
          ),
        )
      ],
    );
  }
}
