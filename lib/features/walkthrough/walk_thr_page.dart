import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/walkthrough/walk_thru_data.dart';

// this is the page i'm using to display each walkthrough
class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: AppPallette.appBlack,
            ),
          ),

          SizedBox(height: 8),

          Text(
            data.description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppPallette.appBlack,
            ),
          ),

          Expanded(
            child: Center(child: Image.asset(data.imagePath, fit: BoxFit.fill)),
          ),
        ],
      ),
    );
  }
}
