import 'package:flutter/material.dart';
import 'package:flutter_application_1/home1.dart';
import 'package:flutter_application_1/home2.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/splash.dart';

const SAVE_KEY = "UserLoggedIn";

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySpalsh(),
    );
  }
}