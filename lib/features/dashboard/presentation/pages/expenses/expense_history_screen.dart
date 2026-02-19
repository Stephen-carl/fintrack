import 'package:flutter/material.dart';
import 'package:youverify/core/common/widgets/app_text_field.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/dashboard/presentation/widgets/expense_repeated_widget.dart';

class ExpenseHistoryScreen extends StatefulWidget {
  const ExpenseHistoryScreen({super.key});

  @override
  State<ExpenseHistoryScreen> createState() => _ExpenseHistoryScreenState();
}

class _ExpenseHistoryScreenState extends State<ExpenseHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: CircleAvatar(
              backgroundColor: AppPallette.homeProfileColor,
              child: Icon(
                Icons.chevron_left_outlined,
                size: 24,
                color: AppPallette.appBlack,
              ),
            ),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              AppTextField(
                hintText: 'Search',
                controller: _searchController,
                keyboardType: TextInputType.text,
                isPassword: false,
                isSearch: true,
              ),

              SizedBox(height: 24),

              Column(
                children: [
                  ExpensesRepeatedWidget(),

                  SizedBox(height: 16),

                  ExpensesRepeatedWidget(),

                  SizedBox(height: 16),

                  ExpensesRepeatedWidget(),

                  SizedBox(height: 16),

                  ExpensesRepeatedWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
