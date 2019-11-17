import 'package:flutter/material.dart';
import './components/fu-input.dart' as FormInput;

class LoginContainer extends StatefulWidget{ //动态widget还是要看一下滴。
  LoginContainer({Key key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}
class LoginState extends State<LoginContainer> {
  double borderWidth = 2.0; //边框宽度

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    Color borderColor = Color.fromRGBO(255, 255, 255, 1.0); //边框颜色
    Color hintTextColor = Color.fromRGBO(183, 183, 183, 1.0); //提示文字颜色
    Color textColor = Color.fromRGBO(73, 252, 231, 1.0); //输入框文字颜色
    double wExtent = deviceWidth * 0.8; //容器宽度
    Map contentPadding = { 
      "left": 10.0,
      "top": 15.0,
      "right": 10.0,
      "bottom": 15.0,
    };
    

    final _fromKey = GlobalKey <FormState> ();

    login(){
      print("我要登录了!!!");
    }
    typeInput(String hintText, {String type, var controllerFun, var focusBorderColor}){
      return FormInput.fuInput(
        borderColor: borderColor,
        hintTextColor: hintTextColor,
        textColor: textColor,
        borderWidth: borderWidth,
        contentPadding: contentPadding,
        fontSize: 16.0,
        inputType: type, 
        hintText: hintText,
        controllerFun: controllerFun,
        focusBorderColor: focusBorderColor
      );
    }

    //响应输入框操作
    final _controller = TextEditingController();
    // _controller.addListener((){
    //   print(_controller.text);
    // });
    textFs(){
      print("111");
    }

    //文字样式
    TextStyle txtstyle({double fontSize: 16.0, String fontWeight: "bold", fontColor}){
      if(fontColor == null) fontColor =  Color.fromRGBO(80, 150, 233, 1.0);
      return TextStyle(
        fontWeight: fontWeight == "bold" ? FontWeight.bold : FontWeight.normal, //只有粗体和普通字体
        fontSize: fontSize,
        color: fontColor
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false, //禁止键盘顶起页面
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('images/station.jpg'),
            fit: BoxFit.fitHeight
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            //logo
            // Image.asset('images/insLogo.png'),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              width: wExtent,
              child: Form(
                //key: _fromKey,
                child: Column(
                  children: <Widget> [
                    //账号
                    Container(
                      margin:EdgeInsets.only(bottom: 15.0),
                      child: Material(
                        elevation: 100.0,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0)
                          )
                        ),
                        color: Color.fromRGBO(255, 255, 255, 0),
                        child: typeInput("手机号或邮箱", focusBorderColor: Color.fromRGBO(255, 255, 255, 0))
                      ),
                    ),
                    //密码
                    Container(
                      margin:EdgeInsets.only(bottom: 15.0),
                      child: Material(
                        shadowColor: Colors.blue,
                        color: Color.fromRGBO(255, 255, 255, 0),
                        child: typeInput("密码", type:"password", focusBorderColor: Color.fromRGBO(255, 255, 255, 0))
                      )
                    ),
                    //忘记密码
                    Container(
                      width: wExtent,
                      margin: EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "忘记密码了?",
                        style: txtstyle(fontSize: 14.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    //登录按钮
                    RaisedButton(
                      color: Color.fromRGBO(80, 150, 233, 1.0),
                      child: Container(
                        width: wExtent,
                        padding: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                        child: Text(
                          "登录",
                          textAlign: TextAlign.center,
                          style: txtstyle(fontColor: Color.fromRGBO(255, 255, 255, 1.0), fontWeight: "normal"),
                        ),
                      ),
                      onPressed: login
                    ),
                    //手机登录入口
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: wExtent,
                      child: Text(
                        "手机验证码登录",
                        textAlign: TextAlign.center,
                        style: txtstyle()
                      )
                    ),
                    //注册
                    Container(
                      margin: EdgeInsets.only(top: 60.0),
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "还没有账户?",
                              style: txtstyle(fontColor: Color.fromRGBO(255, 255, 255, 1.0))
                            ),
                            TextSpan(
                              text: "注册",
                              style: txtstyle()
                            )
                          ]
                        )
                      ),
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