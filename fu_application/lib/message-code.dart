import 'package:flutter/material.dart';
import './components/fu-input.dart' as FormInput;
import './commonMethod.dart' as Methods;

 class MessageCode extends StatefulWidget{
   MessageCode({Key key}) : super(key: key);
   @override
   MessageCodeState createState() => MessageCodeState();
 }

 class MessageCodeState extends State<MessageCode>{
   @override
   void initState(){
    super.initState();
   }
  
   @override
   Widget build(BuildContext context){
     double deviceWidth = MediaQuery.of(context).size.width;
     double deviceHeight = MediaQuery.of(context).size.height;
     double wExtent = deviceWidth * 0.8;
     //判断手机号码格式
     bool verityPhone = false;
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
    //发送验证码
    postCode(){
      bool res = Methods.identifyPhoneType("15825568423");
      print(res);
    }
     return Scaffold(
       body: GestureDetector(
         onTap: (){
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
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white,
                        width: 2.0
                      )
                    )
                  ),
                  margin: EdgeInsets.only(bottom: 20.0),
                  width: wExtent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex:3,
                        child: FormInput.fuInput(
                          hintText: "请输入手机号",
                          borderColor: Color.fromRGBO(255, 255, 255, 0), 
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
                        child:OutlineButton(
                          //验证码发送状态
                          onPressed: postCode,
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
              ],
            )
        ),
       )
     );
   }
 }
