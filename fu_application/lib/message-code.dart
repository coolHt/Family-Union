import 'package:flutter/material.dart';
import './components/fu-input.dart' as FormInput;

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
     Map contentPadding = { 
      "left": 0.0,
      "top": 15.0,
      "right": 0.0,
      "bottom": 15.0,
    };
    
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
                  child: FormInput.fuInput(
                    hintText: "请输入手机号",
                    borderColor: Color.fromRGBO(255, 255, 255, 0), 
                    focusBorderColor: Color.fromRGBO(255, 255, 255, 0),
                    fontSize: 16.0, 
                    textColor: Colors.white,
                    contentPadding: contentPadding,
                    keyboardType: "number"
                  )
                ),
              ]
            )
        ),
       )
     );
   }
 }
