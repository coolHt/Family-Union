//首页
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class MainHome extends StatefulWidget{
  MainHome({
    Key key
  }): super(key: key);
  @override
  MainHomeState createState() => MainHomeState();
}



class MainHomeState extends State<MainHome>{
  List bgUrls = <String>["images/au.jpg","images/beauty.jpg","images/farry.jpg","images/house.jpg","images/mountains.jpg","images/rainfost.jpg","images/scenery.jpg"];
  String randomBg = "";
  @override void initState() {
    //背景随机切换
    randomBg = bgUrls[0];
    int randomNum = bgUrls.length - 1;
    new Timer.periodic(
      Duration(seconds: 5),
      (Timer t){
        int r = Random().nextInt(randomNum);
        this.setState((){
          randomBg = bgUrls[r];
        });
      }
    );
    super.initState();
  }
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            alignment: Alignment.center,
            image: AssetImage(randomBg)
          )
        ),
      )
    );
  }
}