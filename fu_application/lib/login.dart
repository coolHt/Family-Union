import 'package:flutter/material.dart';
import './components/fu-input.dart' as FormInput;

class LoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    Color borderColor = Color.fromRGBO(255, 255, 255, 1.0); //边框颜色
    Color hintTextColor = Color.fromRGBO(183, 183, 183, 1.0); //提示文字颜色
    Color textColor = Color.fromRGBO(73, 252, 231, 1.0); //输入框文字颜色
    double borderWidth = 2.0; //边框宽度
    final _fromKey = GlobalKey < FormState > ();
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('images/loginBg.jpg'),
            fit: BoxFit.fitHeight
          )
        ),
        child: Column(
          children: <Widget> [
            Image.asset('images/insLogo.png'),
            Container(
              width: deviceWidth * 0.8,
              child: Form(
                //key: _fromKey,
                child: Column(
                  children: <Widget> [
                    FormInput.fuInput(
                      hintText: "手机号或邮箱", 
                      borderColor: borderColor,
                      hintTextColor: hintTextColor,
                      textColor: textColor,
                      borderWidth: borderWidth
                    ),
                    FormInput.fuInput(
                      inputType: "password", 
                      hintText: "密码", 
                      borderColor: borderColor,
                      hintTextColor: hintTextColor,
                      textColor: textColor,
                      borderWidth: borderWidth
                    )
                  ],
                )
              )
            )
          ],
        )
      )
    );
  }
}