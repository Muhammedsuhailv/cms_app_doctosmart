import 'dart:async';

import 'package:cms_app/features/signin/presentation/pages/signin_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff01BFE1),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/onboarding.png',
            fit: BoxFit.cover,
          ),
          Center(
           child: Image(image: AssetImage("assets/logo.png"),width: 80,),
          ),
          Positioned(
              bottom: 25,
              left: MediaQuery.of(context).size.width / 2 - 28,
              child: Text("Doctosmart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),))
        ],
      ),
    );
  }
}
