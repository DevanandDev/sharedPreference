import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HomePage')),
        actions: [
          IconButton(onPressed: (){
            SignOut(context);
          }, icon: Icon(Icons.exit_to_app),),
        ],
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Icon(Icons.home,color: Colors.white,size: 50,),
        ),
      ),
    );
  
  }
  SignOut(BuildContext ctx) async{
    final _sharedpref = await SharedPreferences.getInstance();
       _sharedpref.clear();

    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>MyLogin()), (route) => false,);
  }
}