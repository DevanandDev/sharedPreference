import 'package:flutter/material.dart';
import 'package:flutter_application_1/home1.dart';
import 'package:flutter_application_1/home2.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySpalsh extends StatefulWidget {
  const MySpalsh({super.key});

  @override
  State<MySpalsh> createState() => _MySpalshState();
}

class _MySpalshState extends State<MySpalsh> {
  @override
  void initState() {
    
   checkUserLoged();
    super.initState();
   
  }
   Future<void> gotoLogin(BuildContext context) async{
      await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>MyLogin()));

    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text('Spalsh Screen')),
        
      ),
    );
  }
     Future<void> checkUserLoged() async{
      final _sharedpref = await SharedPreferences.getInstance();
      final _userLoged = _sharedpref.getBool(SAVE_KEY);

      if(_userLoged == null || _userLoged == false)
      {
        gotoLogin(context);
      }
      else
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));
      }
     }
  
}