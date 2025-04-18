import 'package:fitnessbot/config/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(clipBehavior: Clip.none, children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 2.6,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 115,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(1.95, 1.95),
                    blurRadius: 2.6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/images/ar-camera.png",
                  height: 20,
                  width: 20,
                  color: AppColors.blueColor,
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
