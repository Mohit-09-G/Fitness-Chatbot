import 'package:fitnessbot/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController targetController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

  var selectedTarget = ''.obs;
  var selectedGender = ''.obs;
  var selectedBloodGroup = ''.obs;

  final RxList<String> gymTargets = List.generate(
    12,
    (index) => '${index + 1} Month${index == 0 ? '' : 's'}',
  ).obs;

  final RxList<String> genders = ['Male', 'Female', 'Other'].obs;

  final RxList<String> bloodGroups =
      ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'].obs;

  void selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dateController.text = '${picked.day}/${picked.month}/${picked.year}';
    }
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      print("Form Submitted ✅");
      print("Name: ${nameController.text}");
      print("Gender: ${selectedGender.value}");
      print("Target: ${selectedTarget.value}");
      print("DOB: ${dateController.text}");
      print("Height: ${heightController.text}");
      print("Weight: ${weightController.text}");
      print("Blood Group: ${selectedBloodGroup.value}");
    } else {
      print("Form Not Valid ❌");
    }
  }

  navigateTopCreateProfile() {
    Get.toNamed(AppRoutes.createProfile);
  }
}
