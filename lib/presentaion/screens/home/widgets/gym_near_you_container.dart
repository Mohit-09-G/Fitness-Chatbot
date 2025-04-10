import 'package:fitnessbot/config/app_images.dart';
import 'package:fitnessbot/config/app_string.dart';
import 'package:fitnessbot/config/customtextstyle.dart';
import 'package:fitnessbot/config/screenutils.dart';
import 'package:flutter/material.dart';

class GymNearYouContainer extends StatelessWidget {
  final String workout;
  final String time;
  final String location;
  final Color cardColor;
  const GymNearYouContainer(
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
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(4, 4),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
          color: cardColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: screen.screenHeight * 0.015,
          children: [
            Text(
              workout,
              style: AppTextStyles.body16black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: screen.screenHeight * 0.01,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppImages.clock,
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(time)
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImages.pin,
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(location)
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImages.star,
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(AppString.rating)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
