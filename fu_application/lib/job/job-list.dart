
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'dart:convert';



//职位列表容器
class JobListContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var rawJson1 = '{ "companyName": "上海大众", "jobName": "4s店总经理", "salary": "30.0 - 50.0W","date": "2019.9.26"}';
    var rawJson2 = '{ "companyName": "嘉兴敏惠汽车零部件有限公司", "jobName": "生管部经理", "salary": "30.0 - 40.0W","date": "2019.9.27"}';
    var rawJson3 = '{ "companyName": "宁波嘉致二手车经纪有限公司", "jobName": "汽车销售经理、销售顾问", "salary": "12.0 - 36.0W","date": "2019.9.28"}';
    List lists = [
      json.decode(rawJson1),//json 转回的是map类型
      json.decode(rawJson2),
      json.decode(rawJson3)
    ];
    void getHttp() async{ //数据请求
      try {
        Response response = await Dio().post("http://127.0.0.1:5555/api/user", data:{"Account":"huangtian12","Pwd":"huangtian2812"});
        print('success');
        print(response);
      }catch(e){
        print(e);
      }
    }
    getHttp();
    
  

    return Scaffold(
      appBar: AppBar(
        title: Text('测试看看')
      ),
      body: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(
                context, 
                '/jobDetail',
                arguments: <String, String>{
                  'jobname': lists[index]['jobName']
                }
              );
            },
            child: jobList(lists[index])
          );
        }
      )
    );
  }
}
//单个职位
Card jobList(Map data){
    return Card(
      margin: EdgeInsets.all(15.0),
        child:Padding(
          padding: EdgeInsets.all(14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        data['jobName'],
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        '宁波 | 10年以上经验 | 大专',
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        data['companyName'],
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                    Text(
                      '外资(欧美) | 10000人以上 | 汽车及零配件',
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.0,
                      )
                    )
                  ],
                )
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        data['salary'],
                        style: TextStyle(
                          fontSize: 15.0
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        data['date'],
                        style: TextStyle(
                          fontSize: 15.0
                        )
                      ),
                    ),
                    Image(
                      width: 50.0,
                      image: AssetImage('images/job.jpg'),
                    )
                  ],
                )
              ),
            ],
          )
        
      )
    );
  
}