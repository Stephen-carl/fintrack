import 'package:flutter/material.dart';
import 'package:youverify/core/common/widgets/app_button.dart';
import 'package:youverify/core/common/widgets/app_text_field.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/auth/presentation/pages/email_verification_screen.dart';
import 'package:youverify/features/auth/presentation/pages/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _referralController.dispose();
    super.dispose();
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
                      'Let’s get started! 🎉',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppPallette.appBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Join us and start managing your finances with Fintrack today.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 32),

                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First & Last Name',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          AppTextField(
                            hintText: 'e.g John Doe',
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            isPassword: false,
                          ),

                          SizedBox(height: 24),

                          Text(
                            'Email Address',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          AppTextField(
                            hintText: 'e.g email@mail.com',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            isPassword: false,
                            validator: (value){
                              final emailRegex = RegExp(r'^\S+@\S+\.\S+$');
                              if (!emailRegex.hasMatch(_emailController.text)) {
                                return 'Please enter a valid email address';
                              } else {
                                return null;
                              }
                            },
                          ),

                          SizedBox(height: 24),

                          Text(
                            'Enter a referral code(optional)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          AppTextField(
                            hintText: 'e.g email@mail.com',
                            controller: _nameController,
                            keyboardType: TextInputType.text,
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
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    text: 'Create an account',
                    onPressed: () {
                      // TODO: go to next page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailVerificationScreen(
                            email: _emailController.text,
                            nextPage: 'signup',
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 24),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppPallette.appBlack,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppPallette.globalColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
