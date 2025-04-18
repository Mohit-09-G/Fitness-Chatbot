import 'package:fitnessbot/presentaion/contoller/chatbot/chatbot_contoller.dart';
import 'package:fitnessbot/presentaion/contoller/home/home_contoller.dart';
import 'package:fitnessbot/presentaion/contoller/profile_controller.dart/profile_contoller.dart';
import 'package:fitnessbot/presentaion/mainscreen/contoller/main_screen_contoller.dart';
import 'package:fitnessbot/presentaion/mainscreen/contoller/statcontoller/statstics_contoller.dart';

import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory<HomeContoller>(() => HomeContoller());
  getIt.registerFactory<MainScreenContoller>(() => MainScreenContoller());
  getIt.registerFactory<StatsticsContoller>(() => StatsticsContoller());
  getIt.registerFactory<ChatbotController>(() => ChatbotController());
  getIt.registerFactory<ProfileController>(() => ProfileController());
}
