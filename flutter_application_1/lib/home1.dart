import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  addIntoSP() async{
    SharedPreferences _shared = await  SharedPreferences.getInstance();
    _shared.setInt('value', 1234);
  }
  getIntoSP() async{
       SharedPreferences _shared = await SharedPreferences.getInstance();
          int? result=  await  _shared.getInt('value');
         print(result);
  }    

  setStrigSP() async{
    SharedPreferences _shared= await SharedPreferences.getInstance();
    _shared.setString('val', 'deva');
  }
  getStringSp() async{
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? result= await _shared.getString('val');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  addIntoSP();
                }, child: Text('setint')),
                ElevatedButton(onPressed: (){
                  getIntoSP();
                }, child: Text('getint'))
              ],
            ),
                 Row(
              children: [
                ElevatedButton(onPressed: (){
                  setStrigSP();
                }, child: Text('setstring')),
                ElevatedButton(onPressed: (){
                  getStringSp();
                }, child: Text('getstring'))
              ],
            ),
                 Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text('setdouble')),
                ElevatedButton(onPressed: (){}, child: Text('getdouble'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}