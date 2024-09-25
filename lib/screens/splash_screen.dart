import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/controller.dart/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Image.asset(
              'assets/image/movie_logo.png', // Replace with your app's logo
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
 
            const Text(
              "MovieApp",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Explore movies & shows",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 40),
            // Loading indicator to indicate splash activity
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
