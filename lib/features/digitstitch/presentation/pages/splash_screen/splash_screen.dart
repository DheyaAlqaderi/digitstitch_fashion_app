import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 50.0),
              height: 266.0,
              child: Image.asset('assets/images/logo.png', fit: BoxFit.cover,),
            ),
          ),

          Positioned(
            bottom: 50.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              width: 333.0, // Set your custom width
              height: 56.0, // Set your custom height
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom( // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Corner radius
                  ),
                ),
                child: const Text(
                  'لنبدأ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.48,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
