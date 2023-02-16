import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/screens/forgot_password.dart';
import 'package:mapbox_turn_by_turn/screens/login.dart';
import 'package:mapbox_turn_by_turn/screens/register.dart';
import 'package:mapbox_turn_by_turn/screens/ui/splash.dart';
import '../screens/doctor_detail.dart';
import '../screens/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const Splash(),
  '/login': (context) => const Login(),
  '/register': (context) => const Register(),
  '/forget_password': (context) => const ForgotPassword(),
  '/home': (context) => const Home(),
  '/detail': (context) => const SliverDoctorDetail(),
  '/book_appointment': (context) => const SliverDoctorDetail(),
};
