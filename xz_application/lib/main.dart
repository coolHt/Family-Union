import 'package:flutter/material.dart';
//网络调试
import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'dart:convert';
//路由列表
//import './route-list.dart' as R;
//职位列表
import './job/job-list.dart' as Jobs;
//企业列表
import './company/company-list.dart' as Companys;
//职位详情
import './job/job-detail.dart' as JobDetail;
//
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
//外部服务器代理
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_proxy/shelf_proxy.dart';

void main(){
  FlipperClient flipperClient = FlipperClient.getDefault();
  
  flipperClient.addPlugin(new FlipperReduxInspectorPlugin());
  flipperClient.addPlugin(new FlipperSharedPreferencesPlugin());
  flipperClient.start();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //proxyAddress();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Jobs.JobListContainer(),
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

void proxyAddress() async{
  //设置外部代理
  var server = await shelf_io.serve(
    proxyHandler('http://122.112.143.38:8004'),
    '127.0.0.1',
    8333
  );
  print(server.address);
  print('Proxying at http://${server.address.host}:${server.port}');
  try{
    Dio dio = new Dio();
    String jsonStr = '{"action":"reg", "type":"p","mobil":"15825568423"}';
    Map<String, dynamic> obj = json.decode(jsonStr);
    Response response = await dio.post("http://122.112.143.38:8004/Psninfo", data:obj);
    print(response.data.toString());
  }catch(e){
    print(e);
  }
}


