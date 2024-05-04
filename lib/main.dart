import 'package:flutter/material.dart';
import 'package:flutter_nasa_app/container_injection.dart';
import 'package:flutter_nasa_app/presentation/pages/today_apod/today_apod_page.dart';

void main() async{
  await setupContainer();
  runApp(const AstronomyPicture());
}

class AstronomyPicture extends StatelessWidget {
  const AstronomyPicture({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AstronomyPicture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodayApodPage(),
    );
  }
}
