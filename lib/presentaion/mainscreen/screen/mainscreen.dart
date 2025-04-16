import 'package:fitnessbot/presentaion/mainscreen/contoller/main_screen_contoller.dart';
import 'package:fitnessbot/presentaion/mainscreen/screen/bottombar/custom_bottom_bar.dart';
import 'package:fitnessbot/presentaion/screens/chatbot/chat_bot_screen.dart';
import 'package:fitnessbot/presentaion/screens/home/home_screen.dart';
import 'package:fitnessbot/presentaion/screens/statistics/statistics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List items = [
    HomeScreen(),
    Container(
      height: 50,
      color: Colors.amber,
    ),
    Statistics(),
    Container(
      height: 50,
      color: Colors.amber,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final MainScreenContoller controller = Get.put(MainScreenContoller());
    return Scaffold(
      body: Obx(() {
        return items[controller.selectedIndex.value];
      }),
      floatingActionButton: CustomBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
