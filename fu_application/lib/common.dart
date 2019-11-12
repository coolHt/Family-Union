import 'package:flutter/material.dart';
//大标题
Text maximumTitle(String words, {Color initColor}){ //文字, 字体颜色, 
  return Text(
    words,
    textAlign: TextAlign.left,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: initColor == null ? Colors.black : initColor,
    )
  );
}