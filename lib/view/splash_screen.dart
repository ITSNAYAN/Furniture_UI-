import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     _navigateToHome(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 248, 255),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(child: Text("Oak & Essence",style:  GoogleFonts.dancingScript(fontSize: 30,fontWeight: FontWeight.bold),)),
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
