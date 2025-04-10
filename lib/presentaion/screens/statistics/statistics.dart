import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/presentaion/mainscreen/contoller/statcontoller/statstics_contoller.dart';
import 'package:fitnessbot/presentaion/screens/statistics/widets/overiewContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:fitnessbot/config/customtextstyle.dart';
import 'package:fitnessbot/config/screenutils.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil(context);
    final StatsticsContoller controller = Get.put(StatsticsContoller());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenUtil.screenHeight * 0.1),
        child: SizedBox(height: screenUtil.screenHeight * 0.1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: screenUtil.screenHeight * 0.07,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Statistics", style: AppTextStyles.heading24),
                      Text(
                        DateFormat('d MMM yyyy').format(DateTime.now()),
                        style: AppTextStyles.body14black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xffF7F9FA),
            height: screenUtil.screenHeight * 0.12,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('M',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0070F0))),
                      Text('T',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0070F0))),
                      Text('W',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0070F0))),
                      Text('T',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0070F0))),
                      Text('F',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0070F0))),
                      Text('S',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0070F0))),
                      Text('S',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0070F0))),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Obx(() {
                        return PageView.builder(
                          controller: controller.pageController.value,
                          onPageChanged: controller.onPageChanged,
                          itemBuilder: (_, pageIndex) {
                            final weekStart =
                                controller.getWeekStart(pageIndex);
                            final weekDates = List.generate(
                              7,
                              (i) => weekStart.add(Duration(days: i)),
                            );

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(7, (index) {
                                  final date = weekDates[index];
                                  final isToday = controller.isSameDay(
                                      date, DateTime.now());

                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: isToday
                                          ? Colors.black
                                          : Colors.transparent,
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        '${date.day}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: isToday
                                              ? Colors.white
                                              : AppColors.mediumGray,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Overview",
                  style: AppTextStyles.body18,
                ),
                SizedBox(
                  height: screenUtil.screenHeight * 0.135,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.overviewItems.length,
                      itemBuilder: (context, index) {
                        var item = controller.overviewItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Overiewcontainer(
                            icon: item.icon,
                            value: item.value,
                            label: item.label,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
