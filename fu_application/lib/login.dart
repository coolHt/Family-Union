import 'package:flutter/material.dart';

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
          children: < Widget > [
            Image.asset('images/insLogo.png'),
            Container(
              width: 200.0,
              child: Form(
                //key: _fromKey,
                child: Column(
                  children: < Widget > [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "hello, there is input",
                        labelStyle: TextStyle(
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)), //这么变态

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