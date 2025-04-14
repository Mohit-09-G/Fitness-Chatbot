import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/config/customtextstyle.dart';
import 'package:flutter/material.dart';

class Overiewcontainer extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const Overiewcontainer(
      {super.key,
      required this.icon,
      required this.value,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlueAccent.withValues(alpha: 0.2)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      icon,
                      color: AppColors.blueColor,
                    ),
                  )),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: AppTextStyles.body14black,
                  ),
                  Text(
                    label,
                    style: AppTextStyles.body14black,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
