import 'package:fitnessbot/di/injection.dart';
import 'package:fitnessbot/presentaion/contoller/home/home_contoller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeContoller>(getIt<HomeContoller>());
  }
}
