import 'package:flutter/material.dart';
import 'package:flutter_news/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_news/screens/login/login_screen.dart';
import 'package:flutter_news/screens/register/register_screen.dart';
import 'package:flutter_news/screens/welcome/welcome_screen.dart';

// สร้างตัวแปรแบบ Map
Map<String, WidgetBuilder> routes = {
  "/welcome": (BuildContext context) => WelcomeScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/register": (BuildContext context) => RegisterScreen(),
  "/dashboard": (BuildContext context) => DashboardScreen(),
};