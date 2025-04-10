import 'package:fitnessbot/config/app_images.dart';
import 'package:fitnessbot/presentaion/screens/home/widgets/circular_white_baground.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularWhiteBaground(
            imagesPath: AppImages.category,
          ),
          Row(
            spacing: 15,
            children: [
              CircularWhiteBaground(
                imagesPath: AppImages.msg,
              ),
              CircularWhiteBaground(
                imagesPath: AppImages.notification,
              ),
            ],
          )
        ],
      ),
    );
  }
}
