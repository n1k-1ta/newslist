import 'package:flutter/material.dart';
import 'package:newslist/di/locator.dart';
import 'features/news/presentation/screens/news_screen.dart';

void main() {
  setupLocator(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color(0xFF1F1B1C),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1F1B1C),
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Color(0xFFAC8F32)),
          bodyLarge: TextStyle(color: Color(0xFFF6F3EC)),
        ),
      ),
      home: NewsScreen(),
    );
  }
}
