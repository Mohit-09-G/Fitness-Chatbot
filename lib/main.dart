import 'package:fitnessbot/binding/home/home_binding.dart';
import 'package:fitnessbot/binding/manscreen/mainscreenbinding.dart';
import 'package:fitnessbot/config/app_routes.dart';
import 'package:fitnessbot/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:fitnessbot/di/injection.dart' as get_it;

void main() async {
  await get_it.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.mainScreen,
      initialBinding: Mainscreenbinding(),
      getPages: Pages.routes,
    );
  }
}
