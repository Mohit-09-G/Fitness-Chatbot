import 'package:fitnessbot/config/customtextstyle.dart';
import 'package:fitnessbot/config/screenutils.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenUtil.screenHeight * 0.1),
          child: SizedBox(
            height: screenUtil.screenHeight * 0.1,
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: screenUtil.screenHeight * 0.07,
              child: Row(
                children: [
                  Column(
                    spacing: screenUtil.screenHeight * 0.011,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Statistics",
                        style: AppTextStyles.heading24,
                      ),
                      Text(
                        "June 2022",
                        style: AppTextStyles.body14black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.screenHeight * 0.15,
            child: Container(
              color: Color(0xffF7F9FA),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(7, (index) {
                        final weekdayLetters = [
                          'M',
                          'T',
                          'W',
                          'T',
                          'F',
                          'S',
                          'S'
                        ];
                        return Text(
                          weekdayLetters[index],
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
