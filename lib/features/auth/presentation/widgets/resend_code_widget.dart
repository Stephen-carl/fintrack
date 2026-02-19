import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

class ResendCodeWidget extends StatefulWidget {
  const ResendCodeWidget({super.key});

  @override
  State<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  Timer? _timer;
  int _remainingSeconds = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    setState(() {
      _canResend = false;
      _remainingSeconds = 60;
    });

    // Create a timer that ticks every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          // Countdown finished, allow resending
          _canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _onResendTap() {
    if (_canResend) {
      // TODO: Implement resend code logic

      // in the mean time, start the countdown
      _startCountdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Didn't receive the email? ",
          style: TextStyle(fontSize: 14, color: AppPallette.appGrey),
        ),
        GestureDetector(
          onTap: _onResendTap,
          child: Text(
            _canResend ? 'Resend code' : 'Resend code $_remainingSeconds secs',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _canResend
                  ? AppPallette.globalColor
                  : AppPallette.appBlack,
            ),
          ),
        ),
      ],
    );
  }
}
