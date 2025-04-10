import 'package:fitnessbot/config/app_colors.dart';
import 'package:flutter/material.dart';

class CircularWhiteBaground extends StatelessWidget {
  final String imagesPath;
  const CircularWhiteBaground({super.key, required this.imagesPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(width: 0.5, color: AppColors.circleBorder)),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Image.asset(
          imagesPath,
          height: 18,
          width: 18,
        ),
      ),
    );
  }
}
