import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/presentaion/screens/profile/create_profile/profile_image.dart';
import 'package:fitnessbot/presentaion/screens/profile/widget/profiledata_continer.dart';
import 'package:flutter/material.dart';

class CreateUserProfile extends StatelessWidget {
  const CreateUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SizedBox(
            height: 70,
          )),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.white,
                ),
                Positioned(
                  top: -180,
                  left: 20,
                  right: 20,
                  child: Stack(clipBehavior: Clip.none, children: [
                    ProfiledataContiner(),
                    Positioned(
                      top: -80,
                      left: 20,
                      right: 20,
                      
                      child: ProfileImage(),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _submit(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _submit() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      decoration: BoxDecoration(
          color: AppColors.blueColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Profile",
              style: TextStyle(
                  height: 0,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
