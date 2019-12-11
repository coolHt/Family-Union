//首页
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget{
  MainHome({
    Key key
  }): super(key: key);
  @override
  MainHomeState createState() => MainHomeState();
}

class MainHomeState extends State<MainHome>{
  List bgUrls = <String>["images/beach.jpg","images/beauty.jpg","images/farry.jpg","images/house.jpg","images/mountains.jpg","images/rainfost.jpg","images/scenery.jpg"];
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red
        ),
      )
    );
  }
}