import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const AppButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallette.globalColor,
        // padding: EdgeInsets.symmetric(vertical: 12),
        minimumSize: Size(double.infinity, 48),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(text),
    );
  }
}