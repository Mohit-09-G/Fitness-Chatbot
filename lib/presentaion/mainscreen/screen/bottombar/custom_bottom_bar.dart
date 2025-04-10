import 'package:fitnessbot/config/app_colors.dart';
import 'package:fitnessbot/config/app_images.dart';
import 'package:fitnessbot/presentaion/mainscreen/contoller/main_screen_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenContoller controller = Get.find();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.12),
              offset: Offset(12, 14),
              blurRadius: 56,
              spreadRadius: 0,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buttons(AppImages.home, 0, controller, "Home"),
            _buttons(AppImages.search, 1, controller, "Search"),
            _buttons(AppImages.graph, 2, controller, "Statistics"),
            _buttons(AppImages.profile, 3, controller, "Profile")
          ],
        ),
      ),
    );
  }

  Widget _buttons(String iconPath, int index, MainScreenContoller controller,
      String label) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return GestureDetector(
        onTap: () {
          controller.selectedIndex.value = index;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Image.asset(
                iconPath,
                height: 24,
                width: 24,
                color: isSelected ? Colors.white : AppColors.mediumGray,
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Text(
                  label,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}
