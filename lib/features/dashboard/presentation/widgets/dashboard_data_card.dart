import 'package:flutter/material.dart';
// import 'package:youverify/core/pallette/app_pallette.dart';

class DashboardCardData {
  final String title;
  final String amount;
  final String subtitle;
  final String? buttonText;
  final Color bgColor;
  final Color textColor;
  final Color? buttBg;
  final Color? buttText;
  final String image;
  final String? progress;

  DashboardCardData({
    required this.title,
    required this.amount,
    required this.subtitle,
    this.buttonText,
    required this.bgColor,
    required this.image,
    required this.textColor,
    this.buttBg,
    this.buttText,
    this.progress,
  });
}

class DashboardCard extends StatelessWidget {
  final DashboardCardData data;

  const DashboardCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: data.bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // bottom right deco
          Positioned(
            right: -10,
            bottom: -10,
            child: Opacity(opacity: 1, child: Image.asset(data.image)),
          ),

          // Card Content
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    Expanded(
                      child: Text(
                        data.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: data.textColor,
                        ),
                      ),
                    ),

                    // Button
                    data.buttonText != null
                      ? GestureDetector(
                      onTap: () {
                        // print('${data.buttonText} tapped');
                      },

                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2.5,
                        ),
                        decoration: BoxDecoration(
                          color: data.buttBg,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data.buttonText!,
                              style: TextStyle(
                                fontSize: 10,
                                color: data.buttText,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 4),

                            Icon(
                              Icons.chevron_right_outlined,
                              size: 18,
                              color: data.buttText,
                            ),
                          ],
                        ),
                      ),
                    )
                    : SizedBox(height: 2),
                  ],
                ),

                // Amount and subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          data.amount,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: data.textColor,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.visibility_outlined,
                          size: 20,
                          color: data.textColor.withOpacity(0.8),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      data.subtitle,
                      style: TextStyle(fontSize: 12, color: data.textColor),
                    ),
                  ],
                ),

                data.progress != null
                    ? Image.asset(data.progress!)
                    : SizedBox(height: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
