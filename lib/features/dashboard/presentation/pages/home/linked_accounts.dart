import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/core/services/sp_service.dart';
import 'package:youverify/features/dashboard/presentation/pages/home/linked_account_details.dart';
import 'package:youverify/features/dashboard/presentation/widgets/dashboard_data_card.dart';
import 'package:youverify/features/dashboard/presentation/widgets/linked_account_widget.dart';

class LinkedAccounts extends StatefulWidget {
  const LinkedAccounts({super.key});

  @override
  State<LinkedAccounts> createState() => _LinkedAccountsState();
}

class _LinkedAccountsState extends State<LinkedAccounts> {
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

  final DashboardCardData _cards = DashboardCardData(
    title: 'Account balance',
    amount: '\$ 1,000,500.55',
    subtitle: 'the total balance from your linked accounts.',
    buttonText: 'Link bank accounts >',
    bgColor: AppPallette.globalColor,
    image: 'assets/images/vault.png',
    textColor: Colors.white,
    buttBg: Colors.white,
    buttText: AppPallette.globalColor,
  );

  final DashboardCardData _newCards = DashboardCardData(
    title: 'Account balance',
    amount: '\$ 0.0',
    subtitle: 'The total balance from your linked bank accounts.',
    buttonText: 'Link bank accounts >',
    bgColor: AppPallette.globalColor,
    image: 'assets/images/vault.png',
    textColor: Colors.white,
    buttBg: Colors.white,
    buttText: AppPallette.globalColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linked Account'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: CircleAvatar(
              backgroundColor: AppPallette.globalColor,
              child: Icon(
                Icons.chevron_left_outlined,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                child: userStatus == true
                    ? DashboardCard(data: _cards)
                    : DashboardCard(data: _newCards),
              ),

              SizedBox(height: 16),

              LinkedAccountWidget(
                widget: Image.asset('assets/images/kuda.png'),
                title: 'Kuda Bank',
                subtitle: '9900256060',
                amount: '25,987.56',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LinkedAccountDetailsScreen(
                        wid: Image.asset('assets/images/kuda.png'),
                        title: 'Kuda Bank',
                        subtitle: '9900256060',
                        amount: '25,987.56',
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 16),

              LinkedAccountWidget(
                widget: Image.asset('assets/images/gt.png'),
                title: 'Guaranty Trust Bank',
                subtitle: '9900256060',
                amount: '100,987.56',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LinkedAccountDetailsScreen(
                        wid: Image.asset('assets/images/gt.png'),
                        title: 'Guaranty Trust Bank',
                        subtitle: '9900256060',
                        amount: '100,987.56',
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 16),

              LinkedAccountWidget(
                widget: Image.asset('assets/images/uba.png'),
                title: 'United Bank of Africa',
                subtitle: '9900256060',
                amount: '1,000,987.56',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LinkedAccountDetailsScreen(
                        wid: Image.asset('assets/images/uba.png'),
                        title: 'United Bank of Africa',
                        subtitle: '9900256060',
                        amount: '1,000,987.56',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
