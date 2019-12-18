import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation; //在指定的时间段内生成0 - 1.0之间的值
  AnimationController controller; //在给定期间内会线性生成从 0.0 到 1.0 的数字, 是继承于animation的类
  @override            
  void initState() {            
    super.initState();            
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this); //vsync 的存在防止后台动画消耗不必要的资源,来自SingleTickerProviderStateMixin 
    controller.addListener((){
      setState(() {
        //print(controller.value);
      });
    });
    controller.addStatusListener((state){
      print(state);
      //判断完成后重新来一遍
      if(state == AnimationStatus.completed){
        print("完成");
        controller.reverse();
      }
      if(state == AnimationStatus.dismissed){
        //print("完成");
        controller.forward();
      }
    });
    //tween 自定义开始点与结束点，通过animate应用于控制器AnimationController,替代AnimationController默认生成的0 - 1的值
    //animate()方法返回的是animation类型
    // animation = Tween<double>(begin: 0, end: 300).animate(controller)..addListener(() { //值改变时调用addListener, 内部再调用setState()重绘       
    //   setState(() {  
    //     print(animation.value);          
    //     // The state that has changed here is the animation object’s value.            
    //   });            
    // });            
    controller.forward(); //手动开启动画             
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red.withOpacity(controller.value),
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 300.0,
        width: 300.0,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
