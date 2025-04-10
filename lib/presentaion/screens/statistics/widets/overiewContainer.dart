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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 5,
            children: [
              Icon(icon),
              Text(
                value,
                style: AppTextStyles.body14black,
              ),
              Text(
                label,
                style: AppTextStyles.body14black,
              )
            ],
          ),
        ));
  }
}
