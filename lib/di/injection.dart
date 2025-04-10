import 'package:fitnessbot/presentaion/contoller/home/home_contoller.dart';
import 'package:fitnessbot/presentaion/mainscreen/contoller/main_screen_contoller.dart';

import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory<HomeContoller>(() => HomeContoller());
  getIt.registerFactory<MainScreenContoller>(() => MainScreenContoller());
}
