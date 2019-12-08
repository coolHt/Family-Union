import 'package:flutter/material.dart';
import './fu-input.dart' as FormInput;

class FillMessage extends StatefulWidget {
  FillMessage({
    Key key
  }): super(key: key);
   
  @override
  FillMessageState createState() => FillMessageState();
}
class FillMessageState extends State<FillMessage> {
  @override
  Widget build(BuildContext context) {
    double wExtent = MediaQuery.of(context).size.width * 0.8;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Container(
            width: wExtent * 0.13,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: Colors.white
                )
              )
            ),
            child: FormInput.fuInput(
              keyboardType: "number",
              textLength: 1,
              focusBorderColor: Colors.transparent,
              fontSize: 20.0,
              textColor: Colors.white,
              textPos: "center",
              showCursor: false,
              borderColor: Colors.transparent,
              hintTextColor: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}