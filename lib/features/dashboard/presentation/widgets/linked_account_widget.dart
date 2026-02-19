import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class LinkedAccountWidget extends StatelessWidget {
  final Widget widget;
  final String title;
  final String subtitle;
  final String amount;
  final VoidCallback? onTap;

  const LinkedAccountWidget({
    super.key,
    required this.widget,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: AppPallette.lightBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widget,

                SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppPallette.appBlack,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppPallette.deepGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Text(
              '\$ $amount',
              style: TextStyle(
                fontSize: 12,
                color: AppPallette.appBlack,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
