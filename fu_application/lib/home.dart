//首页
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class MainHome extends StatefulWidget{
  MainHome({
    Key key,
  }): super(key: key);
  @override
  MainHomeState createState() => MainHomeState();
}

class MainHomeState extends State<MainHome> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  List bgUrls = <String>["images/au.jpg","images/beauty.jpg","images/house.jpg","images/mountains.jpg","images/rainfost.jpg","images/scenery.jpg","images/farry.jpg"];
  String randomBg = "";
  @override void initState() {
    //背景随机切换
    randomBg = bgUrls[0];
    int randomNum = bgUrls.length - 1;
    new Timer.periodic(
      Duration(seconds: 5),
      (Timer t){
        int r = math.Random().nextInt(randomNum);
        this.setState((){
          randomBg = bgUrls[r];
        });
      }
    );
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this
    )..repeat();
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
        // child: Transform.rotate(
        //   angle: _controller.value * 2.0,
        //   child: Container(
        //     margin: EdgeInsets.fromLTRB(50.0, 50.0, 0, 0),
        //     decoration: BoxDecoration(
        //       color: Colors.red
        //     ),
        //     width: 50,
        //     height: 50
        //   ),
        // ),
        child: AnimatedBuilder(
          animation: _controller,
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
            child: const Center(
              child: Text('Wee'),
            ),
          ),
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: child,
            );
          },
        )
        
      )
    );
  }
}