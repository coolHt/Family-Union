//输入框组件
/*
param:
double fontSize: 普通状态下文字大小
String hintText: 提示语
Colors hintTextColor: 提示语颜色
double hintFontSize: 提示语文字大小(默认与输入的文字大小一致)
Colors textColor: 普通状态下文字颜色
Colors borderColor: 普通状态下边框颜色
Colors focusBorderColor: 获得焦点时输入框边框颜色
double borderWidth: 普通状态下边框宽度
double foucsBorderWidth: 获得焦点时输入框边框宽度
String inputType: 输入框类型
double inputRadius: 输入框圆角
double focusInputRadius: 获得焦点时输入框圆角
Map contentPadding: 内部padding,需要四个都指定了left:'',right:'',top:'',bottom:''
var controllerFun 方法
focusnode //焦点事件
string keyboardType //键盘类型
bool showCursor //是否显示指示线
icon //icon样式
textPos //文字位置
textLength //文字长度
暂时就先这样
文字位置(左中右)
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//自定义输入框
//class FormInput {
  TextFormField fuInput({
    double fontSize = 14.0,
    String hintText = "",
    Color hintTextColor,
    double hintFontSize,
    Color textColor,
    Color borderColor,
    Color focusBorderColor, 
    double borderWidth = 1.0,
    double foucsBorderWidth, 
    String inputType = "", //两种类型, 不填是普通文本, password是加密
    double inputRadius = 5.0,
    double focusInputRadius,
    Map contentPadding,
    dynamic controllerFun, //操作的方法
    dynamic focusnode, //焦点控制的方法
    String keyboardType, //键盘类型  number,phone, 默认text
    dynamic iconAssets, //设置icon
    bool showCursor = true, //是否显示指示线
    String textPos = "left", //文字位置
    int textLength = 0, //文字长度
  }){
    if(contentPadding == null){
      contentPadding = {
        "left": 8.0,
        "top": 10.0,
        "right": 8.0,
        "bottom": 10.0
      };
    }
    if(hintTextColor == null) hintTextColor = Color.fromRGBO(183, 183, 183, 1.0);
    if(textColor == null) textColor = Color.fromRGBO(51, 51, 51, 1.0);
    if(borderColor == null) borderColor = Color.fromRGBO(51, 51, 51, 1.0);
    if(focusBorderColor == null) focusBorderColor = Color.fromRGBO(51, 51, 51, 1.0);
    if(foucsBorderWidth == null) foucsBorderWidth = borderWidth; //默认情况下, 获得焦点的宽度跟普通状态是一样的
    if(hintFontSize == null) hintFontSize = fontSize; //默认情况下, 提示的文字大小跟输入框文字大小一样
    if(focusInputRadius == null) focusInputRadius = inputRadius; //默认情况下, 获得焦点的圆角跟普通状态的圆角相同
    //键盘样式转换
    typeOfKeyboard(){
      switch(keyboardType){
        case "number":
          return TextInputType.number;
        case "phone":
          return TextInputType.phone;
        default:
          return null;
      }
    }
    //文字位置
    textAlignPosition(){
      switch(textPos){
        case "left":
          return TextAlign.left;
        case "center":
          return TextAlign.center;  
        case "right":
          return TextAlign.right; 
        default:
          return TextAlign.left; 
      }
    }
    return TextFormField(
      //最大字符
      maxLength: textLength > 0 ? textLength : null,
      //文字位置
      textAlign: textAlignPosition(),
      //是否显示指示线?
      showCursor: showCursor,
      // textAlign: TextAlign(),
      //焦点事件
      focusNode: focusnode,
      //键盘类型
      keyboardType:typeOfKeyboard(),
      //是否加密
      obscureText: inputType == 'password' ? true : false,
      //文字效果
      style: TextStyle(
        color:textColor,
        fontSize: fontSize
      ),
      //
      decoration: InputDecoration(
        counterText: "", //设置不显示底部文字计数
        // icon: Image(
        //   width: 30.0,
        //   fit: BoxFit.fitWidth,
        //   image: AssetImage("images/phone.png"),
        // ),
        icon: iconAssets,
        //背景颜色
        //padding
        contentPadding: EdgeInsets.fromLTRB(
          contentPadding['left'], 
          contentPadding['top'], 
          contentPadding['right'], 
          contentPadding['bottom']
        ),
        //提示文字和样式
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: hintFontSize
        ),
        //
        enabledBorder: OutlineInputBorder(
          //圆角，暂时4个角一起设置
          borderRadius: BorderRadius.circular(inputRadius),
          //边框宽跟颜色
          borderSide: BorderSide( 
            width: borderWidth,
            color: borderColor
          ),
        ),
        //o焦点状态下的边框
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(focusInputRadius),
          borderSide: BorderSide(
            width: foucsBorderWidth,
            color: focusBorderColor
          )
        ),
      ),
      //传入的控制方法
      controller: controllerFun,
      //onTap
      //focusNode: ,
    );
}
//}

