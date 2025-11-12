import 'package:flutter/material.dart';
import 'package:portfolio_website/features/home_screen/pages/home_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rifat Hasan',
      theme: ThemeData.dark(),
      home: HomeScreenPage(),
    );
  }
}


