import 'package:flutter/material.dart';
import 'dart:async';
import './components/fu-input.dart'
as FormInput;
import './commonMethod.dart'
as Methods;

import './components/code-block.dart' as CodeBlock;

class MessageCode extends StatefulWidget {
  MessageCode({
    Key key
  }): super(key: key);
  @override
  MessageCodeState createState() => MessageCodeState();
}

class MessageCodeState extends State <MessageCode> {
  //监听输入
  final _controller = TextEditingController();
  //判断手机号码格式
  bool verityPhone = false;
  //倒计时
  num countNum = 60;
  //是否显示倒计时
  bool showNum = false;
  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text != "") {
        bool res = Methods.identifyPhoneType(_controller.text);
        if (res && showNum == false) {
          //验证通过
          this.setState(() {
            verityPhone = true;
          });

        } else {
          //验证失败
          this.setState(() {
            verityPhone = false;
          });
        }
      }
    });
    super.initState();
  }

  //倒计时
  void countDown() {
    const timeout = const Duration(seconds: 1);
    new Timer.periodic(
      timeout,
      (Timer t) {
        countNum -= 1;
        this.setState(() {
          countNum = countNum;
        });
        if (countNum == 0) {
          t.cancel();
          //需要校验一下号码是否匹对
          bool reConfirm = Methods.identifyPhoneType(_controller.text);
          //初始化
          this.setState((){
            showNum = false;
            verityPhone = reConfirm;
            countNum = 60;
          });
        }
      }
    );
  }

  //发送验证码
  postCode() {
    this.setState((){
      showNum = true;
      verityPhone = false;
    });
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double wExtent = deviceWidth * 0.8;

    Map contentPadding = {
      "left": 0.0,
      "top": 15.0,
      "right": 0.0,
      "bottom": 15.0,
    };
    //手机样式icon
    var iconStyle = Image(
      width: 30.0,
      fit: BoxFit.fitWidth,
      image: AssetImage("images/phone.png"),
    );

    //倒计时widget
    Container countNumber(){
      return Container(
          width: wExtent,
          child: Text(
            "$countNum秒后可重新获取",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold
            )
          ),
        );
    }
    //验证码小方块
    codePartition(){
      var verifyBlock = List<Widget>();
      for(int i = 0; i < 6; i++){
        Widget single = CodeBlock.FillMessage();
        verifyBlock.add(single);
      }
      return verifyBlock;
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('images/dusk.jpg'),
              fit: BoxFit.fitHeight
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: < Widget > [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 2.0
                    )
                  )
                ),
                margin: EdgeInsets.only(bottom: 10.0),
                width: wExtent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: < Widget > [
                    Expanded(
                      flex: 3,
                      child: FormInput.fuInput(
                        controllerFun: _controller,
                        hintText: "请输入手机号",
                        borderColor: Colors.transparent,
                        focusBorderColor: Color.fromRGBO(255, 255, 255, 0),
                        fontSize: 16.0,
                        textColor: Colors.white,
                        contentPadding: contentPadding,
                        keyboardType: "number",
                        iconAssets: iconStyle
                      )
                    ),
                    //获取验证码
                    Expanded(
                      child: OutlineButton(
                        //验证码发送状态
                        onPressed: verityPhone ? postCode : null,
                        disabledBorderColor: Colors.transparent,
                        padding: EdgeInsets.all(0),
                        borderSide: BorderSide(
                          color: Colors.transparent
                        ),
                        child: Text(
                          "获取验证码",
                          style: TextStyle(
                            fontSize: 16.0
                          )
                        ),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                )
              ),
              Container(
                child: showNum ? countNumber() : null,
              ),
              //验证码
              Container(
                margin: EdgeInsets.only(top: 30.0),
                width: wExtent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: codePartition(), //验证码
                ),
              )
            ],
          )
        ),
      )
    );
  }
}