import 'package:flutter/material.dart';
import './fu-input.dart' as FormInput;

class FillMessage extends StatefulWidget {
  double wExtent;
  double inputWidth;
  FillMessage({
    Key key,
    this.wExtent, //整体宽度
    this.inputWidth //输入框宽度
  }): super(key: key);
  @override
  FillMessageState createState() => FillMessageState();
}
class FillMessageState extends State<FillMessage> {
  double fill_wExtent;
  double fill_inputWidth;
  void initState(){
    fill_wExtent = 1;
    fill_inputWidth = 1;
  }
  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: < Widget > [
          // Container(
          //   width: wExtent * 0.13,
          //   decoration: BoxDecoration(
          //     border: Border(
          //       bottom: BorderSide(
          //         width: 2.0,
          //         color: Colors.white
          //       )
          //     )
          //   ),
          //   child: FormInput.fuInput(
          //     keyboardType: "number",
          //     textLength: 1,
          //     focusBorderColor: Colors.transparent,
          //     fontSize: 20.0,
          //     textColor: Colors.white,
          //     textPos: "center",
          //     showCursor: false,
          //     borderColor: Colors.transparent,
          //     hintTextColor: Colors.white
          //   ),
          // ),
        ],
      ),
    );
  }
}