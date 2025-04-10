import 'package:fitnessbot/di/injection.dart';
import 'package:fitnessbot/presentaion/mainscreen/contoller/main_screen_contoller.dart';
import 'package:get/instance_manager.dart';

class Mainscreenbinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainScreenContoller>(getIt<MainScreenContoller>());
  }
}
