import 'package:flutter/material.dart';
import 'package:minto/constands/constands.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 200, child: Image.asset('assets/images/minto_logo.png')),
            const Text(
              'MINTO',
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Bryndan',
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'chose your favorite ',
              style: TextStyle(fontSize: 20, fontFamily: 'Bryndan'),
            ),
          ],
        ),
      ),
    );
  }
}
