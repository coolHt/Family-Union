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
     return Scaffold(
       body: Container(
         child: Text(
           "hello"
         )
       )
     );
   }
 }
