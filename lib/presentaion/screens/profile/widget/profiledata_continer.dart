import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/presentaion/contoller/profile_controller.dart/profile_contoller.dart';
import 'package:fitnessbot/presentaion/screens/profile/widget/cutomtextfilled.dart';
import 'package:fitnessbot/presentaion/screens/profile/widget/dropdown_textfild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfiledataContiner extends StatefulWidget {
  const ProfiledataContiner({super.key});

  @override
  State<ProfiledataContiner> createState() => _ProfiledataContinerState();
}

class _ProfiledataContinerState extends State<ProfiledataContiner> {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: profileController.formKey,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 60,
            children: [
              SizedBox(),
              Column(
                children: [
                  _buildLabel("Full Name"),
                  CustomTextField(
                    hint: "Name",
                    controller: profileController.nameController,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("Gender"),
                            DropdownTextfild(
                              hint: "Select gender",
                              controller: profileController.genderController,
                              items: profileController.genders,
                              onItemSelected: (val) {
                                profileController.selectedGender.value = val;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("Target"),
                            DropdownTextfild(
                              hint: "Select target",
                              controller: profileController.targetController,
                              items: profileController.gymTargets,
                              onItemSelected: (val) {
                                profileController.selectedTarget.value = val;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildLabel("DOB"),
                  GestureDetector(
                    onTap: () => profileController.selectDate(context),
                    child: AbsorbPointer(
                      child: CustomTextField(
                        hint: "dd/mm/yyyy",
                        controller: profileController.dateController,
                        suffix: Icon(Icons.calendar_month_rounded,
                            color: AppColors.blueColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("Height (cm)"),
                            CustomTextField(
                              hint: "0",
                              controller: profileController.heightController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("Weight (kg)"),
                            CustomTextField(
                              hint: "0",
                              controller: profileController.weightController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildLabel("Blood Group"),
                  DropdownTextfild(
                    hint: "Select blood group",
                    controller: profileController.bloodGroupController,
                    items: profileController.bloodGroups,
                    onItemSelected: (val) {
                      profileController.selectedBloodGroup.value = val;
                    },
                  ),
                  const SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: profileController.submitForm,
                  //   child: Text("Submit"),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
