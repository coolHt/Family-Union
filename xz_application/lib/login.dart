import 'package:flutter/material.dart';
import 'dart:io';

class LoginContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:ExactAssetImage('images/loginBg.jpg'),
            fit:BoxFit.fitHeight
          )
        ),
        child: Column(
          children: <Widget>[
            Image.asset('images/insLogo.png')
          ],
        )
      )
    );
  }
}