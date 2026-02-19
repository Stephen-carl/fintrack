import 'package:flutter/material.dart';
import 'package:youverify/core/common/widgets/app_button.dart';
import 'package:youverify/core/common/widgets/app_text_field.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/core/services/sp_service.dart';
import 'package:youverify/features/auth/presentation/pages/account_setup_screen.dart';
import 'package:youverify/features/auth/presentation/widgets/resend_code_widget.dart';
import 'package:youverify/features/dashboard/presentation/pages/dashboard_main.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final String nextPage;
  const EmailVerificationScreen({
    super.key,
    required this.email,
    required this.nextPage,
  });

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _spService = SpService();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (widget.nextPage == 'login') {
        _spService.setUserStatus(true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardMain()),
        );
      } else if (widget.nextPage == 'signup') {
        _spService.setUserStatus(false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AccountSetupScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check your email!',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppPallette.appBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'We have sent an email to ${widget.email}. Please remember to check your inbox as well as the spam folder.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Please enter the verification code below to continue with your account.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 16),

                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter verification code',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          AppTextField(
                            hintText: 'Enter code here',
                            controller: _otpController,
                            keyboardType: TextInputType.number,
                            isPassword: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    text: 'Continue',
                    onPressed: () {
                      _submit();
                    },
                  ),

                  SizedBox(height: 24),

                  // GestureDetector(
                  //   onTap: () {
                  //     // TODO: create a resend mail countdown
                  //   },
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: 'Didn’t recieve the email?  ',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: AppPallette.appGrey,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //       children: [
                  //         TextSpan(
                  //           text: 'Resend code',
                  //           style: TextStyle(
                  //             fontSize: 14,
                  //             color: AppPallette.globalColor,
                  //             fontWeight: FontWeight.w400,
                  //             decoration: TextDecoration.underline,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Center(child: ResendCodeWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
