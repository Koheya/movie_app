import 'package:flutter/material.dart';
import 'package:movies_clean_architecture/core/services/service_locator.dart';
import 'package:movies_clean_architecture/movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff303030),
      ),
      home: const MoviesScreen(),
    );
  }
}
