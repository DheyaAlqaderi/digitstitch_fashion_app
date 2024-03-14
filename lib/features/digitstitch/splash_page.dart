import 'package:digitstitch_app/core/util/images.dart';
import 'package:digitstitch_app/features/digitstitch/onBoarding/presentation/pages/onboarding_page.dart';
import 'package:digitstitch_app/features/digitstitch/root/presentation/pages/root.dart';
import 'package:flutter/material.dart';

import '../../core/helper/shareprefrence_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load data and navigate based on its presence
    loadData();
  }

  Future<void> loadData() async {
    try {
      // Retrieve data
      String? firstTime = await SharedPrefManager.getData('FirstTime');

      print(firstTime);
      // Simulate a delay to mimic loading process
      await Future.delayed(const Duration(seconds: 2));

      if (firstTime == null) {
        // Navigate to OnboardingPage if token is present
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()),
        );
      } else {
        // Navigate to HomePage if token is not present
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RootPage()),
        );
      }
    } catch (e) {
      // Handle error
      print('Error loading data: $e');
      // Navigate to HomePage as fallback

    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Image.asset(Images.logo),
            ),
          )
        ],
      ),
    );
  }
}
