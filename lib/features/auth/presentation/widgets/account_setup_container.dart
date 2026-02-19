import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class AccountSetupContainer extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  const AccountSetupContainer({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        // border: Border.all(color: AppPallette.appGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppPallette.appBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppPallette.appBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Image.asset(imagePath, height: 96, width: 96, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
