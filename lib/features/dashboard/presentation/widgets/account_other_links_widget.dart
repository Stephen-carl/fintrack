import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class AccountOtherLinksWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AccountOtherLinksWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: AppPallette.lightBorder, width: 1.5),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: AppPallette.appBlack),
            ),
            Icon(
              Icons.chevron_right_outlined,
              size: 24,
              color: AppPallette.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
