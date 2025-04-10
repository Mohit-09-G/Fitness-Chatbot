import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/config/app_string.dart';
import 'package:fitnessbot/config/customtextstyle.dart';
import 'package:fitnessbot/config/screenutils.dart';
import 'package:flutter/material.dart';

class UpcomingDataContainer extends StatelessWidget {
  final String workout;
  final String time;
  final String location;
  final Color cardColor;

  const UpcomingDataContainer(
      {super.key,
      required this.workout,
      required this.time,
      required this.location,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    final screen = ScreenUtil(context);
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: cardColor,
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: screen.screenWidth * 0.38,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        workout,
                        style: AppTextStyles.body18black,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(23))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            AppString.fitness,
                            style: AppTextStyles.body10purple,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    time,
                    style: AppTextStyles.caption12black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 20,
                        color: AppColors.mediumGray,
                      ),
                      Text(
                        location,
                        style: AppTextStyles.caption12black,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
