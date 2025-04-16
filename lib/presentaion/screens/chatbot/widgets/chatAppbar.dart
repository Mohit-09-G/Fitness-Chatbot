import 'package:fitnessbot/config/app_images.dart';
import 'package:fitnessbot/config/customtextstyle.dart';
import 'package:fitnessbot/presentaion/screens/home/widgets/circular_white_baground.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chatappbar extends StatelessWidget {
  const Chatappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Get.back();
              },
              child: CircularWhiteBaground(imagesPath: AppImages.backbutton)),
          Row(
            spacing: 5,
            children: [
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffF2F8FF)),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.cchatbot,
                        height: 30,
                        width: 30,
                      ),
                    ],
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FitBot",
                    style: AppTextStyles.body14black,
                  ),
                  Row(
                    children: [
                      Icon(
                        size: 10,
                        Icons.circle,
                        color: Colors.green,
                      ),
                      Text(
                        "Always active",
                        style: AppTextStyles.body14black,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          CircularWhiteBaground(imagesPath: AppImages.threeDots)
        ],
      ),
    );
  }
}
