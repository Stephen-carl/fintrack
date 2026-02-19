import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/dashboard/presentation/widgets/account_details_history_items.dart';

class LinkedAccountDetailsScreen extends StatefulWidget {
  final Widget wid;
  final String title;
  final String subtitle;
  final String amount;
  const LinkedAccountDetailsScreen({
    super.key,
    required this.wid,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  State<LinkedAccountDetailsScreen> createState() =>
      _LinkedAccountDetailsScreenState();
}

class _LinkedAccountDetailsScreenState
    extends State<LinkedAccountDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account details'),
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
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    widget.wid,
                    SizedBox(height: 8),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: AppPallette.appBlack,
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: AppPallette.deepGrey,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),

              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: AppPallette.lightBorder),
                ),
                child: Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsAccountData(
                      title: 'Type of account',
                      subtitle: 'Savings',
                    ),
                    DetailsAccountData(
                      title: 'Account number',
                      subtitle: widget.subtitle,
                    ),
                    DetailsAccountData(
                      title: 'Available balance',
                      subtitle: widget.amount,
                    ),
                    DetailsAccountData(
                      title: 'Date added',
                      subtitle: '16/07/2024',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: AppPallette.lightBorder),
                ),
                child: Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Transactions',
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
                            color: AppPallette.lightBorder,
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

                    Text(
                      'Today, 14/07/2024',
                      style: TextStyle(
                        color: AppPallette.deepGrey,
                        fontSize: 12,
                      ),
                    ),
                    Column(
                      spacing: 16,
                      children: [
                        AccountDetailsHistoryItems(
                          title: 'Do Bowls Hospitality',
                          amount: '10,000.00',
                          avatarText: 'J',
                        ),
                        AccountDetailsHistoryItems(
                          title: 'Paystack checkout',
                          amount: '10,000.00',
                          avatarText: 'J',
                        ),
                        AccountDetailsHistoryItems(
                          title: 'Do Bowls Hospitality',
                          amount: '10,000.00',
                          avatarText: 'J',
                        ),
                      ],
                    ),

                    Text(
                      'Yesterday, 13/07/2024',
                      style: TextStyle(
                        color: AppPallette.deepGrey,
                        fontSize: 12,
                      ),
                    ),

                    Column(
                      spacing: 16,
                      children: [
                        AccountDetailsHistoryItems(
                          title: 'Do Bowls Hospitality',
                          amount: '10,000.00',
                          avatarText: 'J',
                        ),
                        AccountDetailsHistoryItems(
                          title: 'Paystack checkout',
                          amount: '10,000.00',
                          avatarText: 'J',
                        ),
                        AccountDetailsHistoryItems(
                          title: 'Do Bowls Hospitality',
                          amount: '10,000.00',
                          avatarText: 'J',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsAccountData extends StatelessWidget {
  final String title;
  final String subtitle;
  const DetailsAccountData({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, color: AppPallette.deepGrey),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: AppPallette.appBlack),
        ),
      ],
    );
  }
}
