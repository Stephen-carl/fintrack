import 'package:flutter/material.dart';
import 'package:youverify/core/common/widgets/app_button.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/core/services/sp_service.dart';
import 'package:youverify/features/auth/presentation/pages/passcode_setup.dart';
import 'package:youverify/features/auth/presentation/widgets/account_setup_container.dart';
import 'package:youverify/features/dashboard/presentation/pages/dashboard_main.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  final _spService = SpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppPallette.appBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Fintrack',
                            style: TextStyle(
                              color: AppPallette.globalColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: '! \nLet’s get you set up'),
                        ],
                      ),
                    ),

                    SizedBox(height: 50),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AccountSetupContainer(
                          title: 'Set up a pin',
                          description: 'Enhance your  account\nsecurity.',
                          imagePath: 'assets/images/wallet_pin.png',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasscodeSetupScreen(),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 24),

                        AccountSetupContainer(
                          title: 'Link your bank accounts.',
                          description:
                              'Link your bank accounts to\nstart tracking your expenses.',
                          imagePath: 'assets/images/walkthrough1.png',
                          onTap: () {
                            // TODO: go to next page
                          },
                        ),

                        SizedBox(height: 24),

                        AccountSetupContainer(
                          title: 'Create a savings goal',
                          description: 'What are your financial\ngoals?',
                          imagePath: 'assets/images/walkthrough2.png',
                          onTap: () {
                            // TODO: go to next page
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: AppButton(
                text: 'Skip for now',
                onPressed: () {
                  _spService.setUserStatus(false);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardMain()), (route)=>false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
