//主色Colors.amberAccent fad75e
import 'package:flutter/material.dart';
//职位列表
import './job/job-list.dart' as Jobs;
//企业列表
import './company/company-list.dart' as Companys;
//职位详情
import './job/job-detail.dart' as JobDetail;
//登录页面
import './login.dart' as Login;
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login.LoginContainer(),
        '/jobList': (context) => Jobs.JobListContainer(),
        '/jobDetail': (context) => JobDetail.JobDetail(),
        '/companyProfile': (context) => Companys.CompanyListContainer()
      },
      title: '心职',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
    );
  }
}

