import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/core/services/sp_service.dart';
import 'package:youverify/features/dashboard/presentation/pages/expenses/expense_history_screen.dart';
import 'package:youverify/features/dashboard/presentation/widgets/dashboard_data_card.dart';
import 'package:youverify/features/dashboard/presentation/widgets/expense_item_data.dart';
import 'package:youverify/features/dashboard/presentation/widgets/expense_repeated_widget.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final _spService = SpService();
  bool? userStatus = false;

  @override
  void initState() {
    getStatus();
    super.initState();
  }

  Future<void> getStatus() async {
    final bool? status = await _spService.getUserStatus();
    setState(() {
      userStatus = status;
    });
  }

  final DashboardCardData _data = DashboardCardData(
    title: 'Total expenses',
    amount: '\$ 1,000,500.55',
    subtitle: 'spent in the last 7 days',
    bgColor: AppPallette.homeProfileColor,
    image: 'assets/images/cash.png',
    textColor: AppPallette.globalColor,
    progress: 'assets/images/orange_progress.png',
  );

  final DashboardCardData _newData = DashboardCardData(
    title: 'Total expenses',
    amount: '\$ 0.0',
    subtitle: 'You haven’t linked any bank account yet',
    bgColor: AppPallette.homeProfileColor,
    image: 'assets/images/cash.png',
    textColor: AppPallette.globalColor,
    progress: 'assets/images/orange_progress.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Expenses')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                child: userStatus == true
                    ? DashboardCard(data: _data)
                    : DashboardCard(data: _newData),
              ),

              SizedBox(height: 24),

              userStatus == false
                  ? Center(child: Image.asset('assets/images/emptyplate.png'))
                  : Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: BoxBorder.all(
                              color: AppPallette.lightBorder,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sort your expenses',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppPallette.appBlack,
                                  height: 1.5,
                                ),
                              ),

                              GestureDetector(
                                onTap: () {},
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
                        ),

                        SizedBox(height: 24),

                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: BoxBorder.all(
                              color: AppPallette.lightBorder,
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Transactions',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppPallette.appBlack,
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppPallette.softGreen,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExpenseHistoryScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'View All  >',
                                        style: TextStyle(
                                          color: AppPallette.globalColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 24),

                              ExpensesRepeatedWidget(),

                              SizedBox(height: 24),

                              Text(
                                'Yesterday, 13/07/2024',
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
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
