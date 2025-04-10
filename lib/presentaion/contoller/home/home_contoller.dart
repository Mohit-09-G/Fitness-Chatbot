import 'package:fitnessbot/data/models/worlout_planar_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeContoller extends GetxController {
  RxList<WorloutPlanarModel> planer = [
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 6:30 AM",
      location: "Central Park",
      cardColor: Color(0xFFFFE0B2), // Light Orange
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 8:00 AM",
      location: "Downtown Gym",
      cardColor: Color(0xFFB2DFDB), // Teal
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 10:00 AM",
      location: "City Stadium",
      cardColor: Color(0xFFFFCDD2), // Light Red
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 12:00 PM",
      location: "Muscle Zone",
      cardColor: Color(0xFFC8E6C9), // Light Green
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 2:00 PM",
      location: "Sunshine Studio",
      cardColor: Color(0xFFD1C4E9), // Lavender
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 3:30 PM",
      location: "River Track",
      cardColor: Color(0xFFFFF9C4), // Light Yellow
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 5:00 PM",
      location: "Dance House",
      cardColor: Color(0xFFFFF3E0), // Peach
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 6:15 PM",
      location: "Iron Temple",
      cardColor: Color(0xFFBBDEFB), // Light Blue
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 7:30 PM",
      location: "Greenbelt Trail",
      cardColor: Color(0xFFD7CCC8), // Earth Tone
    ),
    WorloutPlanarModel(
      workout: "Workout",
      time: "Today at 9:00 PM",
      location: "Zen Garden",
      cardColor: Color(0xFFF8BBD0), // Soft Pink
    ),
  ].obs;

  final RxList<WorloutPlanarModel> workoutCards = <WorloutPlanarModel>[
    WorloutPlanarModel(
        workout: "Gold's Gym",
        time: "10:00 AM - 8:00 PM",
        location: "Los Angeles, CA",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "Anytime Fitness",
        time: "9:00 AM - 7:00 PM",
        location: "New York, NY",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "Planet Fitness",
        time: "8:00 AM - 6:00 PM",
        location: "San Francisco, CA",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "Iron Temple",
        time: "11:00 AM - 9:00 PM",
        location: "Austin, TX",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "Snap Fitness",
        time: "6:00 AM - 2:00 PM",
        location: "Miami, FL",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "F45 Training",
        time: "12:00 PM - 10:00 PM",
        location: "San Diego, CA",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "CorePower Yoga",
        time: "7:00 AM - 3:00 PM",
        location: "Denver, CO",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "Crunch Fitness",
        time: "5:00 AM - 1:00 PM",
        location: "Las Vegas, NV",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "OrangeTheory Fitness",
        time: "10:30 AM - 6:30 PM",
        location: "Seattle, WA",
        cardColor: Colors.white),
    WorloutPlanarModel(
        workout: "StretchLab",
        time: "1:00 PM - 9:00 PM",
        location: "Phoenix, AZ",
        cardColor: Colors.white),
  ].obs;
}
