import 'package:fitnessbot/binding/home/home_binding.dart';
import 'package:fitnessbot/binding/manscreen/mainscreenbinding.dart';
import 'package:fitnessbot/config/app_routes.dart';
import 'package:fitnessbot/presentaion/mainscreen/screen/mainscreen.dart';
import 'package:fitnessbot/presentaion/screens/home/home_screen.dart';
import 'package:get/route_manager.dart';

class Pages {
  static final routes = [
    GetPage(
        name: AppRoutes.home, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: AppRoutes.mainScreen,
        page: () => Mainscreen(),
        binding: Mainscreenbinding())
  ];
}
