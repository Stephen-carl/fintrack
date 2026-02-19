import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/dashboard/presentation/pages/account_screen.dart';
import 'package:youverify/features/dashboard/presentation/pages/budget_screen.dart';
import 'package:youverify/features/dashboard/presentation/pages/expense_screen.dart';
import 'package:youverify/features/dashboard/presentation/pages/home_screen.dart';
import 'package:youverify/features/dashboard/presentation/pages/savings_screen.dart';

class DashboardMain extends StatefulWidget {
  const DashboardMain({super.key,});

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
  int _selectedIndex = 0;

  // providing the pages orderly
  final List<Widget> _pages = [
    HomeScreen(),
    BudgetScreen(),
    SavingsScreen(),
    ExpenseScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      // so it is both the body and bottom nav that should be on each page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppPallette.globalColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        elevation: 10,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ), 
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart_outline,
            ), 
            label: 'Budgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
            ), 
            label: 'Savings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vert),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ), 
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
