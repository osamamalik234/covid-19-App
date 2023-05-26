import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/covid_app/splash_screen.dart';
import 'package:sample_project/screens/get_started.dart';
import 'package:sample_project/screens/home_screen.dart';
import 'package:sample_project/screens/login_screen.dart';
import 'package:sample_project/screens/ui_design_1.dart';
import 'package:sample_project/views/internet_connectivity.dart';
import 'package:sample_project/views/starter_screen.dart';
import 'package:sample_project/views/bmi_calculator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: user != null ? HomeScreen() : LoginScreen(),
      home: SplashScreen(),
    );
  }
}
