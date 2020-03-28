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
  Animation<double> animation;
  List bgUrls = <String>["images/au.jpg","images/beauty.jpg","images/house.jpg","images/mountains.jpg","images/rainfost.jpg","images/scenery.jpg","images/farry.jpg"];
  String randomBg = "";
  @override void initState() {
    super.initState();
    //背景随机切换
    randomBg = bgUrls[0];
    int randomNum = bgUrls.length - 1;
    //添加动画时长
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    )..addListener((){
      setState((){});
    });
    //监听状态
    _controller.addStatusListener((state){
      //print(state);
      if(state == AnimationStatus.completed){
        switchBackground(randomNum);
        _controller.reverse();
      }
      if(state == AnimationStatus.dismissed){
        switchBackground(randomNum);
        _controller.forward();
      }
    });
    //启动
    _controller.forward();
  }
  //切换背景图片
  void switchBackground(int n){
    int r = math.Random().nextInt(n);
    this.setState((){
      randomBg = bgUrls[r];
    });
  }
  //动画结束清除控制器防止内存溢出
  @override void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override 
  Widget build(BuildContext context){
    double deceiveWidth = MediaQuery.of(context).size.width;
    double deceiveHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: _controller.value,
              child: Container(
                width: deceiveWidth,
                height: deceiveHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(randomBg),
                  )
                )
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: deceiveWidth,
              height: deceiveHeight,
              decoration: BoxDecoration(),
              child: Text(
                "hello",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
            )
          ],
        )
      )
    );
  }
}