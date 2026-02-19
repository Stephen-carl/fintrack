import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class AccountLinksWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final IconData icon;

  const AccountLinksWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: BoxBorder.all(color: AppPallette.lightBorder, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 32, color: AppPallette.softGreen),

              SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppPallette.appBlack,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: AppPallette.deepGrey),
                  ),
                ],
              ),
            ],
          ),

          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: AppPallette.homeProfileColor,
              child: Icon(
                Icons.chevron_right_outlined,
                size: 24,
                color: AppPallette.appBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
