import 'dart:async';

import 'package:burger_app/screens/main_screen.dart';
import 'package:burger_app/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    getValidationData().whenComplete(() async{
      Timer(Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) =>TermScreen()
       // (finalPhone ==null ? AppSingUp() : MyHomePage()),
           ),
         ),
       );
    });
    super.initState();
  }
  Future getValidationData() async{
    // final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    // var obtainPhone=sharedPreferences.getString("mobile");
    // setState(() {
    //   finalPhone=obtainPhone;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[
          Container(
            height: double.infinity,
            child: Image.asset("assets/images/4.jpg",fit: BoxFit.fill,),
        ),
          Container(
            alignment: AlignmentDirectional.center,
            height: double.infinity,
            child: Image.asset("assets/images/logo.png"),
          ),
      ]
      ),
    );
  }
}
