import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/dashboard/presentation/widgets/expense_item_data.dart';

class ExpensesRepeatedWidget extends StatelessWidget {
  const ExpensesRepeatedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today, 14/07/2024',
          style: TextStyle(
            color: AppPallette.deepGrey,
            fontSize: 12,
          ),
        ),
    
        SizedBox(height: 24),
    
        ExpensesItems(
          title: 'Food & Drinks',
          amount: '200,000.00',
          image: 'assets/images/hamburger.png',
        ),
    
        SizedBox(height: 16),
    
        ExpensesItems(
          title: 'Transportation',
          amount: '50,000.00',
          image: 'assets/images/car.png',
        ),
    
        SizedBox(height: 16),
    
        ExpensesItems(
          title: 'Transportation',
          amount: '50,000.00',
          image: 'assets/images/car.png',
        ),
      ],
    );
  }
}