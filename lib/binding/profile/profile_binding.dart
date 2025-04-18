import 'package:fitnessbot/di/injection.dart';
import 'package:fitnessbot/presentaion/contoller/profile_controller.dart/profile_contoller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => getIt<ProfileController>());
  }
}
