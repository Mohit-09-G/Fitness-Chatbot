import 'package:fitnessbot/presentaion/screens/profile/widget/profiledata_continer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SizedBox(
            height: 70,
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [Expanded(child: ProfiledataContiner())],
        ),
      ),
    );
  }
}
