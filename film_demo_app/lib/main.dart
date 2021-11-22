import 'package:film_demo_app/screens/detail_movie.dart';
import 'package:film_demo_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        HomePage.routerName: (context) => HomePage(),
        DetailScreen.routerName: (context)=> DetailScreen(),
      },
      home: HomePage(),
    );
  }
}

