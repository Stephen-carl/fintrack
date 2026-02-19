import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/dashboard/presentation/widgets/account_links_widget.dart';
import 'package:youverify/features/dashboard/presentation/widgets/account_other_links_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Account')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppPallette.globalColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aderinsola Adejuwon',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          'janedoe@gmail.com',
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          '+234 90 1619 2553',
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    CircleAvatar(
                      backgroundColor: AppPallette.homeProfileColor,
                      child: Icon(
                        Icons.edit,
                        color: AppPallette.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // links
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  AccountLinksWidget(
                    title: 'Security',
                    subtitle: 'Enable or disable biometrics',
                    onTap: () {},
                    icon: Icons.shield,
                  ),

                  AccountLinksWidget(
                    title: 'Insights and Reports',
                    subtitle:
                        'A detailed summary of how you have\nmanaged your money',
                    onTap: () {},
                    icon: Icons.drive_eta_rounded,
                  ),

                  AccountLinksWidget(
                    title: 'Support',
                    subtitle: 'We can assist you if you have any\nqueries',
                    onTap: () {},
                    icon: Icons.message_outlined,
                  ),

                  AccountLinksWidget(
                    title: 'Give feedback',
                    subtitle: 'Helps us better the experience for\nyou.',
                    onTap: () {},
                    icon: Icons.error,
                  ),

                  // SizedBox(height: 8,),
                ],
              ),

              SizedBox(height: 24),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(
                        color: AppPallette.lightBorder,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppPallette.alertColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  AccountOtherLinksWidget(
                    title: 'About fintrack',
                    onTap: () {},
                  ),

                  AccountOtherLinksWidget(
                    title: 'Privacy & Terms of Service',
                    onTap: () {},
                  ),

                  AccountOtherLinksWidget(
                    title: 'Request account deletion',
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 24),

              Image.asset('assets/images/account_frame.png', fit: BoxFit.cover),

              SizedBox(height: 24),

              Center(
                child: Text(
                  'V 1.0.0',
                  style: TextStyle(fontSize: 12, color: AppPallette.lightGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
