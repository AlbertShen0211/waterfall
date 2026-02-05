import 'package:flutter/material.dart';
import 'package:waterfall/home_page.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albert Waterfall',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: const HomePage(),
    );
  }
}
