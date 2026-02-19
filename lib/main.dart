import 'package:flutter/material.dart';
import 'package:youverify/core/theme/app_theme.dart';
import 'package:youverify/features/splash/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintrack',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: SplashScreen(),
    );
  }
}