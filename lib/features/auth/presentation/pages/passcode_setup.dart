import 'package:flutter/material.dart';
import 'package:youverify/core/common/widgets/app_button.dart';
import 'package:youverify/core/pallette/app_pallette.dart';
import 'package:youverify/features/auth/presentation/widgets/numpad_widget.dart';

class PasscodeSetupScreen extends StatefulWidget {
  const PasscodeSetupScreen({super.key});

  @override
  State<PasscodeSetupScreen> createState() => _PasscodeSetupScreenState();
}

class _PasscodeSetupScreenState extends State<PasscodeSetupScreen> {
  String _pin = '';
  static const int _pinLength = 4;

  void _onKeyTap(String key) {
    if (key == '<') {
      if (_pin.isNotEmpty) {
        setState(() => _pin = _pin.substring(0, _pin.length - 1));
      }
      return;
    }

    if (_pin.length < _pinLength) {
      setState(() => _pin = _pin + key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create your passcode')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 34),

              Text(
                'For a more secure and convenient way to view your account, create a 4-digit passcode now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppPallette.appBlack,
                ),
              ),

              SizedBox(height: 58),

              // this will help me generate 4 boxs for the pin
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pinLength, (i) {
                  final filled = i < _pin.length;
                  return Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: filled
                            ? AppPallette.globalColor
                            : Colors.grey[300]!,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: filled
                          ? Text(_pin[i], style: TextStyle(fontSize: 24))
                          : Text(
                              '0',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey[400],
                              ),
                            ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 6),

              // Numpad
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Numpad(onKeyTap: _onKeyTap),
                ),
              ),

              AppButton(text: 'Create a Pin', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
