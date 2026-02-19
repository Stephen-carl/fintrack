import 'package:flutter/material.dart';
import 'package:youverify/features/dashboard/presentation/pages/home/linked_accounts.dart';

class LinkMonoAccounts extends StatefulWidget {
  const LinkMonoAccounts({super.key});

  @override
  State<LinkMonoAccounts> createState() => _LinkMonoAccountsState();
}

class _LinkMonoAccountsState extends State<LinkMonoAccounts> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      // Navigate to the next screen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LinkedAccounts()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/mono_link.png')
      ),
    );
  }
}