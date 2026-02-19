import 'package:flutter/material.dart';
import 'package:youverify/core/common/widgets/app_button.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/auth/presentation/pages/login_screen.dart';
import 'package:youverify/features/auth/presentation/pages/signup_screen.dart';
import 'package:youverify/features/walkthrough/walk_thr_page.dart';
import 'package:youverify/features/walkthrough/walk_thru_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // accrding to the figma
  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: 'Track Your Expenses',
      description:
          'Get insights into where your money goes and make informed financial decisions.',
      imagePath: 'assets/images/walkthrough1.png',
    ),
    OnboardingData(
      title: 'Set Savings Goals',
      description:
          'Whether it\'s for a vacation, a new car, or an emergency fund, we help you stay on track.',
      imagePath: 'assets/images/walkthrough2.png',
    ),
    OnboardingData(
      title: 'Get Financial Insights',
      description:
          'Access detailed reports and analytics to make better financial choices.',
      imagePath: 'assets/images/walkthrough3.png',
    ),
  ];

  // i'm designing the modal here
  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppPallette.appBlack,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),

              SizedBox(height: 16),

              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'By pressing accept below you agree to our ',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppPallette.appBlack,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text:
                              '. You can find out more about how we use your data in our ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              AppButton(
                text: 'Accept and Continue',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                children: List.generate(
                  _onboardingData.length,
                  (index) => Expanded(
                    child: Container(
                      height: 4,
                      margin: EdgeInsets.only(
                        right: index < _onboardingData.length - 1 ? 8 : 0,
                      ),
                      decoration: BoxDecoration(
                        color: index == _currentPage
                            ? Colors.black
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // I'm using this method instead of creating three different walkthrough screens
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: _onboardingData[index]);
                },
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.all(24),
              child: Column(
                children: [
                  AppButton(
                    text: 'Create an account',
                    onPressed: () {
                      _showModal();
                    },
                  ),
                  SizedBox(height: 16),

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
