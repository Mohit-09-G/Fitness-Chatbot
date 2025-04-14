import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/presentaion/mainscreen/contoller/statcontoller/statstics_contoller.dart';

import 'package:fitnessbot/presentaion/screens/statistics/widets/health_rings.dart';
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
                  height: screenUtil.screenHeight * 0.14,
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 40,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daily Progress",
                  style: AppTextStyles.body18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HealthRing(),
                    Column(
                      spacing: 15,
                      children: [
                        Row(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Color(0xFF7AD8F5),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sleep"),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '6h 5min',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/8h',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Color(0xffFF9898),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Calories"),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '1050',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/2000',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: Color(0xFFFFD188),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Steps"),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '2015',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/6000',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
