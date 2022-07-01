import 'package:flutter/material.dart';
import 'package:flutter_news/routers.dart';
import 'package:flutter_news/themes/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: routes,
      initialRoute: '/welcome',
    );
  }
}