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

    return ListView.builder(
      itemCount: lists.length,
      itemBuilder: (BuildContext context, int index){
        return jobList(lists[index]);
      }
    );
  }
}
//单个职位
Card jobList(Map data){
    return Card(
      margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    data['jobName'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    )
                  ),
                  Text(
                    data['salary'],
                    style:TextStyle(fontSize: 15.0)
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '宁波 | 5-7年经验 | 大专',
                    style: TextStyle(
                      fontSize: 15.0
                    )
                  ),
                  Text(
                    data['date'],
                    style:TextStyle(fontSize: 15.0)
                  ),
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data['companyName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Row(
                      children: <Widget>[
                        Text('外贸(非欧美) | '),
                        Text('50-150人 | '),
                        Text('汽车及零配件'),
                      ],
                    )
                  ]
                ),
                Image(
                  width: 40.0,
                  image: AssetImage('images/job.jpg'),
                )
              ]
            )
          ],
        )
      )
    );
  
}