import 'package:flutter/material.dart';
import 'package:minto/constands/constands.dart';
import 'package:minto/pages/homescreen.dart';

import 'auth/login.dart';
import 'auth/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minto Restaurant App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: bgColor),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => SplashScreen(),
        '/login': (_) => LoginPage(),
        '/home': (_) => HomeScreen(),
      },
    );
  }
}
