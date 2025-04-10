import 'package:fitnessbot/data/models/overviewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StatsticsContoller extends GetxController {
  RxList<OverviewItemModel> overviewItems = [
    OverviewItemModel(
      icon: Icons.local_fire_department_outlined,
      value: "3,950",
      label: "Cal Burnt",
    ),
    OverviewItemModel(
      icon: Icons.access_time,
      value: "3 hr",
      label: "Total Time",
    ),
    OverviewItemModel(
      icon: Icons.fitness_center,
      value: "12",
      label: "Exercises",
    ),
  ].obs;

  final selectedDate = DateTime.now().obs;
  final focusedDate = DateTime.now().obs;
  final weeksBefore = 1000;
  final pageController = PageController(initialPage: 1000).obs;

  DateTime getWeekStart(int page) {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    return weekStart.add(Duration(days: (page - weeksBefore) * 7));
  }

  void onPageChanged(int page) {
    focusedDate.value = getWeekStart(page);
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    focusedDate.value = date.subtract(Duration(days: date.weekday - 1));
  }

  bool isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  String get formattedSelectedDate =>
      DateFormat('EEEE, MMMM d, yyyy').format(selectedDate.value);

  String get currentDateTitle {
    final now = DateTime.now();
    return "Today, ${DateFormat('d MMM yyyy').format(now)}";
  }
}
