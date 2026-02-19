import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class ExpensesItems extends StatelessWidget {
  final String title;
  final String amount;
  final String image;
  const ExpensesItems({
    super.key,
    required this.title,
    required this.amount,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppPallette.expenseGrey,
              child: Image.asset(image),
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
          '\$ $amount',
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