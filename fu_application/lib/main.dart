//主色Colors.amberAccent fad75e
import 'package:flutter/material.dart';
//首页
import './home.dart' as Home;
//职位列表
import './job/job-list.dart' as Jobs;
//企业列表
import './company/company-list.dart' as Companys;
//职位详情
import './job/job-detail.dart' as JobDetail;
//登录页面
import './login.dart' as Login;
//验证码登录页面
import './message-code.dart' as MessageCode;
//测试
import './test.dart' as Test;

void main(){
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Test.LogoApp(),
        //'/': (context) => Home.MainHome(),
        '/jobList': (context) => Jobs.JobListContainer(),
        '/jobDetail': (context) => JobDetail.JobDetail(),
        '/companyProfile': (context) => Companys.CompanyListContainer(),
        '/login': (context) => Login.LoginContainer(),
        '/messagecode': (context) => MessageCode.MessageCode()
      },
      title: '心职',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
    );
  }
}

