import 'package:flutter/material.dart';
//职位列表
import './job/job-list.dart' as Jobs;

void main() => runApp(MyApp());

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
          title: Text('心职')
        ),
        body: Container(
          child: Jobs.JobListContainer()
        )
      )
    );
  }
}


