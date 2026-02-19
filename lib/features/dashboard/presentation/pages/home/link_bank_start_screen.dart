import 'package:flutter/material.dart';
import 'package:youverify/core/common/widgets/app_button.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/dashboard/presentation/pages/home/link_mono_accounts.dart';

class LinkBankStartScreen extends StatefulWidget {
  const LinkBankStartScreen({super.key});

  @override
  State<LinkBankStartScreen> createState() => _LinkBankStartScreenState();
}

class _LinkBankStartScreenState extends State<LinkBankStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                'Link your bank accounts!',
                style: TextStyle(fontSize: 32, height: 1.2),
              ),
              SizedBox(height: 8),
              Text(
                'Link your bank accounts to help us make sense of your finances',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/balance_link.png',
                    width: 350,
                    height: 350,
                  ),
                ),
              ),

              Column(
                children: [
                  AppButton(
                    text: 'Link bank account',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LinkMonoAccounts(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppPallette.appBlack,
                        fontWeight: FontWeight.w400,
                      ),
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
