import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/controllers/splashcontroller/splashcontroller.dart';

class SplashscreenState extends StatefulWidget {
  const SplashscreenState({super.key});

  @override
  State<SplashscreenState> createState() => _SplashscreenStateState();
}

class _SplashscreenStateState extends State<SplashscreenState> {
  Splashcontroller controller=Get.put(Splashcontroller());

  @override
  void initState() {
    
    controller.movenext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(child:
     Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/splash.png'),fit: BoxFit.cover)),)
      ) );
  }
}