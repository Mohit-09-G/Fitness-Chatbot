import 'package:fitnessbot/di/injection.dart';
import 'package:fitnessbot/presentaion/mainscreen/contoller/statcontoller/statstics_contoller.dart';
import 'package:get/get.dart';

class StatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StatsticsContoller>(getIt<StatsticsContoller>());
  }
}
