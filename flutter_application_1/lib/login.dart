import 'package:flutter/material.dart';
import 'package:flutter_application_1/home2.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLogin extends StatelessWidget {
 MyLogin({super.key});

  final _usernameController =TextEditingController();
  final _passwordController =TextEditingController();
  // bool _isDataMatched = false;
  final _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Login Page',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
            
              children: [
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _usernameController,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          validator: (value){
                            if (value == null || value.isEmpty)
                            {
                              return 'value is empty';
                            }
                            else{
                              return null;
                            }
                          }
                          ),
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        validator: (value){
                              if(value == null || value.isEmpty)
                              {
                                return 'Value is Empty';
                              }
                              else{
                                return null;
                              }
                        }
                  ),
                ),
                ElevatedButton(onPressed: () {
                  if(_formKey.currentState!.validate())
                  {
                    checkLogin(context);
                  }
                  else{
                    print('data is empty');
                  }
                }, child: Text('Log in')),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void checkLogin(BuildContext ctx) async{
     final _username= _usernameController.text; 
     final _password = _passwordController.text;

     if(_username == 'deva' && _password =='1234' ) 
     {
      print(_username);
     Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));

     final _sharedpref = await  SharedPreferences.getInstance();
        _sharedpref.setBool(SAVE_KEY, true);
     }
     else{
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Username and password does not match'),backgroundColor: Colors.red,));
     }

  }

}
