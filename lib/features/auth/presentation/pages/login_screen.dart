import 'package:flutter/material.dart';
import 'package:youverify/core/common/widgets/app_button.dart';
import 'package:youverify/core/common/widgets/app_text_field.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/auth/presentation/pages/email_verification_screen.dart';
import 'package:youverify/features/auth/presentation/pages/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => EmailVerificationScreen(
            email: _emailController.text,
            nextPage: 'login',
          ),
        ),
        (route) => false,
      );
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
                      'Welcome back 🎉',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppPallette.appBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Sign in to your account and start managing your finances with Fintrack today.',
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
                            'Email address',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),

                          AppTextField(
                            hintText: 'Enter your email',
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
                    text: 'Sign In',
                    onPressed: () {
                      _submit();
                    },
                  ),

                  SizedBox(height: 24),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Do not have an account?  ',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppPallette.appBlack,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
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
