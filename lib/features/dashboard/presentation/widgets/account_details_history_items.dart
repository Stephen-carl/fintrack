import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class AccountDetailsHistoryItems extends StatelessWidget {
  final String title;
  final String amount;
  final String avatarText;
  const AccountDetailsHistoryItems({super.key, required this.title, required this.amount, required this.avatarText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppPallette.softGreen,
              child: Text(avatarText, style: TextStyle(color: AppPallette.globalColor, fontSize: 12, height: 1.5),),
            ),

            SizedBox(width: 12),

            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: AppPallette.appBlack,
                height: 1.5,
              ),
            ),
          ],
        ),

        Text(
          '-\$$amount',
          style: TextStyle(
            fontSize: 12,
            color: AppPallette.appBlack,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}