import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/bottom_navigation/bottom_navigation.dart';
import 'package:movie_task/screens/homescreen.dart';
import 'package:movie_task/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: SplashScreen());
  }
}
