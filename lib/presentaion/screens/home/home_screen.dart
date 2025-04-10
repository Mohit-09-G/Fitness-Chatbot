import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/config/app_images.dart';
import 'package:fitnessbot/config/app_string.dart';
import 'package:fitnessbot/config/customtextstyle.dart';
import 'package:fitnessbot/config/screenutils.dart';
import 'package:fitnessbot/presentaion/contoller/home/home_contoller.dart';
import 'package:fitnessbot/presentaion/screens/home/widgets/gym_near_you_container.dart';
import 'package:fitnessbot/presentaion/screens/home/widgets/home_appbar.dart';
import 'package:fitnessbot/presentaion/screens/home/widgets/upcoming_data_contaner.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeContoller homeContoller = Get.put(HomeContoller());

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenUtil.screenHeight * 0.07),
          child: HomeAppbar()),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: screenUtil.screenHeight * 0.32,
                child: Column(
                  spacing: screenUtil.screenHeight * 0.025,
                  children: [
                    Column(
                      spacing: screenUtil.screenHeight * 0.02,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppString.home,
                              style: AppTextStyles.heading24,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              AppString.upcoming,
                              style: AppTextStyles.body18,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: homeContoller.planer.length,
                        itemBuilder: (context, index) {
                          var items = homeContoller.planer[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  UpcomingDataContainer(
                                    workout: items.workout,
                                    time: items.time,
                                    location: items.location,
                                    cardColor: items.cardColor,
                                  ),
                                  Image.asset(AppImages.women)
                                ]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenUtil.screenHeight * 0.04,
              ),
              SizedBox(
                height: screenUtil.screenHeight * 0.3,
                child: Column(
                  spacing: screenUtil.screenHeight * 0.018,
                  children: [
                    Column(
                      spacing: screenUtil.screenHeight * 0.015,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppString.gymsNearYou,
                              style: AppTextStyles.body18black,
                            ),
                          ],
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: AppColors.mediumGray,
                            ),
                            Text(
                              AppString.starowilna12,
                              style: AppTextStyles.body14black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: homeContoller.workoutCards.length,
                        itemBuilder: (context, index) {
                          var items = homeContoller.workoutCards[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                GymNearYouContainer(
                                  workout: items.workout,
                                  time: items.time,
                                  location: items.location,
                                  cardColor: items.cardColor,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenUtil.screenHeight * 0.05,
              ),
              SizedBox(
                height: screenUtil.screenHeight * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Ativities"),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
