import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trogon/core/utils/utils.dart';
import 'package:trogon/presentation/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   late Timer timer;
 
 @override
  void initState() {
    timer = Timer(const Duration(seconds: 2), (){
      //navigation to home page
      navigatorKey.currentState!.pushReplacement(HomeScreen.route);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: loading(),),
    );
  }
}