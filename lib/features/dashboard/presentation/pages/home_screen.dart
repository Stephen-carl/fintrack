import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/core/services/sp_service.dart';
import 'package:youverify/features/dashboard/presentation/pages/home/link_bank_start_screen.dart';
import 'package:youverify/features/dashboard/presentation/widgets/dashboard_data_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.88);
  int _currentPage = 0;
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

  // this will be for existing customers
  final List<DashboardCardData> _cards = [
    DashboardCardData(
      title: 'Account balance',
      amount: '\$ 1,000,500.55',
      subtitle: 'the total balance from your linked accounts.',
      buttonText: 'Manage Accounts',
      bgColor: AppPallette.globalColor,
      image: 'assets/images/vault.png',
      textColor: Colors.white,
      buttBg: Colors.white,
      buttText: AppPallette.globalColor,
    ),
    DashboardCardData(
      title: 'Total savings',
      amount: '\$ 50,530.00',
      subtitle: 'You need ₦950,000 to meet your targets.',
      buttonText: 'View Savings',
      bgColor: AppPallette.secondaryColor,
      image: 'assets/images/piggybank.png',
      textColor: Colors.white,
      buttBg: Colors.white,
      buttText: AppPallette.secondaryColor,
      progress: 'assets/images/white_progress.png',
    ),
    DashboardCardData(
      title: 'Monthly budget',
      amount: '\$ 1,000,500.55',
      subtitle: 'left out of ₦200,000,000 budgeted.',
      buttonText: 'Manage Budget',
      bgColor: Colors.white,
      image: 'assets/images/target.png',
      textColor: AppPallette.globalColor,
      buttBg: AppPallette.globalColor,
      buttText: Colors.white,
      progress: 'assets/images/orange_progress.png',
    ),
    DashboardCardData(
      title: 'Total expenses',
      amount: '\$ 1,000,500.55',
      subtitle: 'spent in the last 7 days',
      buttonText: 'View expenses',
      bgColor: AppPallette.homeProfileColor,
      image: 'assets/images/cash.png',
      textColor: AppPallette.globalColor,
      buttBg: AppPallette.globalColor,
      buttText: Colors.white,
      progress: 'assets/images/orange_progress.png',
    ),
  ];

  // for new customers
  final List<DashboardCardData> _newCards = [
    DashboardCardData(
      title: 'Account balance',
      amount: '\$ 0.0',
      subtitle: 'The total balance from your linked bank accounts.',
      buttonText: 'Manage Accounts',
      bgColor: AppPallette.globalColor,
      image: 'assets/images/vault.png',
      textColor: Colors.white,
      buttBg: Colors.white,
      buttText: AppPallette.globalColor,
    ),
    DashboardCardData(
      title: 'Total savings',
      amount: '\$ 0.0',
      subtitle: 'You haven’t created any savings goals yet',
      buttonText: 'View Savings',
      bgColor: AppPallette.secondaryColor,
      image: 'assets/images/piggybank.png',
      textColor: Colors.white,
      buttBg: Colors.white,
      buttText: AppPallette.secondaryColor,
      progress: 'assets/images/white_progress.png',
    ),
    DashboardCardData(
      title: 'Monthly budget',
      amount: '\$ 0.0',
      subtitle: 'You haven’t created any budgets yet.',
      buttonText: 'Manage Budget',
      bgColor: Colors.white,
      image: 'assets/images/target.png',
      textColor: AppPallette.globalColor,
      buttBg: AppPallette.globalColor,
      buttText: Colors.white,
      progress: 'assets/images/orange_progress.png',
    ),
    DashboardCardData(
      title: 'Total expenses',
      amount: '\$ 0.0',
      subtitle: 'You haven’t linked any bank account yet',
      buttonText: 'View expenses',
      bgColor: AppPallette.homeProfileColor,
      image: 'assets/images/cash.png',
      textColor: AppPallette.globalColor,
      buttBg: AppPallette.globalColor,
      buttText: Colors.white,
      progress: 'assets/images/orange_progress.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Jane',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Your financial journey starts here.',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: CircleAvatar(
                          backgroundColor: AppPallette.homeProfileColor,
                          child: Icon(Icons.person_outline),
                        ),
                        onPressed: () {},
                        // color: Colors.black87,
                      ),
                      IconButton(
                        icon: CircleAvatar(
                          backgroundColor: AppPallette.homeProfileColor,
                          child: Icon(Icons.notifications),
                        ),
                        onPressed: () {},
                        // color: Colors.black87,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Scrollable Cards Section
            SizedBox(
              height: 160,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: userStatus == true
                        ? DashboardCard(data: _cards[index])
                        : DashboardCard(data: _newCards[index]),
                  );
                },
              ),
            ),

            // Card Indicator
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _cards.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: index == _currentPage ? 24 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: index == _currentPage
                          ? AppPallette.globalColor
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),

            userStatus == false
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: AppPallette.lightBorder),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'You have no activities yet',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppPallette.appBlack,
                              height: 1.5,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            'Hi there, you have no linked\nbank accounts.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppPallette.deepGrey,
                            ),
                          ),

                          SizedBox(height: 16),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppPallette.softGreen,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // TODO: nothing yet
                              },
                              child: Text(
                                'Link Account >',
                                style: TextStyle(
                                  color: AppPallette.globalColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 24),

                          Image.asset('assets/images/emptyplate.png'),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all(
                                color: AppPallette.lightBorder,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Your ',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: AppPallette.appBlack,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Week\n',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          TextSpan(text: 'in '),
                                          TextSpan(
                                            text: 'Money',
                                            style: TextStyle(
                                              fontSize: 28,
                                              color: AppPallette.secondaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 4),

                                    Text(
                                      'See your past week in money',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppPallette.deepGrey,
                                      ),
                                    ),
                                  ],
                                ),

                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LinkBankStartScreen(),
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: AppPallette.softGreen,
                                    foregroundColor: AppPallette.globalColor,
                                    child: Icon(Icons.chevron_right_outlined),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // recent
                          Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all(
                                color: AppPallette.lightBorder,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // text
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Recent Activities',
                                      style: TextStyle(
                                        fontSize: 16,
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
                                          // TODO: nothing yet
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

                                Text(
                                  'Today, 14/07/2024',
                                  style: TextStyle(
                                    color: AppPallette.deepGrey,
                                    fontSize: 12,
                                  ),
                                ),

                                SizedBox(height: 24),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              AppPallette.homeProfileColor,
                                          foregroundColor:
                                              AppPallette.globalColor,
                                          child: Icon(Icons.pie_chart_outline),
                                        ),

                                        SizedBox(width: 12),

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Created a new budget “Trip to\nNairobi”',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppPallette.appBlack,
                                                height: 1.5,
                                              ),
                                            ),

                                            Text(
                                              'a day ago ',
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
                                      '\$ 200,000.00',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppPallette.appBlack,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 16),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              AppPallette.softGreen,
                                          foregroundColor:
                                              AppPallette.globalColor,
                                          child: Text(
                                            'J',
                                            style: TextStyle(
                                              fontSize: 16,
                                              height: 1.5,
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 12),

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'John Ogaga',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppPallette.appBlack,
                                                height: 1.5,
                                              ),
                                            ),

                                            Text(
                                              'Zenith Bank 12:03 AM',
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
                                      '\$ 10,000.00',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppPallette.appBlack,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 24),

                                Text(
                                  'Yesterday, 13/07/2024',
                                  style: TextStyle(
                                    color: AppPallette.deepGrey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
