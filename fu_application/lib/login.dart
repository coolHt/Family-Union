import 'package:flutter/material.dart';
import './components/fu-input.dart' as FormInput;

class LoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
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
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                        hintText: "手机号或邮箱",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1.0)
                        ),
                        enabledBorder: OutlineInputBorder( //需要通过这个来设置边框
                            borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                        )
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.red
                      ),
                    ),
                    FormInput.fuInput()
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                    //     hintText: "密码",
                    //     hintStyle: TextStyle(
                    //       color: Color.fromRGBO(183, 183, 183, 1.0)
                    //     ),
                    //     enabledBorder: OutlineInputBorder( //需要通过这个来设置边框
                    //         borderSide: BorderSide(color: Colors.white, width: 2.0),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                    //     )
                    //   ),
                    //   style: TextStyle(
                    //     fontSize: 14.0,
                    //     color: Colors.red
                    //   ),
                    // )
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