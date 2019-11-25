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
  @override 
  Widget build(BuildContext context){
    return Container(
      child: Text("This is home page")
    );
  }
}