import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//职位列表
import './job/job-list.dart' as Jobs;
//企业列表
import './company/company-list.dart' as Companys;
//职位详情
import './job/job-detail.dart' as JobDetail;
void main(){
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '心职',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('假装是导航栏')
        ),
        body: Container(
          //child: Jobs.JobListContainer()
          //child: Companys.CompanyListContainer()
          child: JobDetail.JobDetail()
        )
      )
    );
  }
}


