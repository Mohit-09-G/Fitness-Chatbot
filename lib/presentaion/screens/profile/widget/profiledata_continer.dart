import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/presentaion/screens/profile/widget/cutomtextfilled.dart';
import 'package:flutter/material.dart';

class ProfiledataContiner extends StatelessWidget {
  const ProfiledataContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 30,
          children: [
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Full Name",
                  style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                CustomTextField(hint: "name"),
              ],
            ),
            Row(
              spacing: 30,
              children: [
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      CustomTextField(
                        hint: "Gender",
                        suffix: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: AppColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Target",
                        style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      CustomTextField(
                          hint: "Target",
                          suffix: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: AppColors.blueColor,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full Name",
                    style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                CustomTextField(hint: "dd/mm/yy"),
              ],
            ),
            Row(
              spacing: 30,
              children: [
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Height (Cm)",
                        style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      CustomTextField(hint: "0"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weight(Kg)",
                        style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      CustomTextField(hint: "0"),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Blood Group",
                  style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                CustomTextField(
                    hint: "",
                    suffix: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.blueColor,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
