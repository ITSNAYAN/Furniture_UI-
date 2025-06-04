import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);
    return const Scaffold(
        body: Column(children: [
            Center(child: Text("splash Screen")),
        ]),);
  }
  void _navigateToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    });
  }
}
