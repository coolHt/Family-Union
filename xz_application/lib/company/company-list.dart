import 'package:flutter/material.dart';

//职位列表容器
class CompanyListContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:ListView(
        children: <Widget>[
          companyList(),
          companyList(),
          companyList(),
          companyList(),
        ]
      )
    );
  }
}

Card companyList(){
    return Card(
      margin: EdgeInsets.only(bottom:15.0),
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex:1,
              child: Image(
                image: AssetImage('images/cPic.jpg'),
                alignment: Alignment.topLeft,
                fit: BoxFit.fitWidth,
              )
            ),
            Expanded(
              flex: 5,
              child:Padding(
                padding: EdgeInsets.only(left: 15.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        '上海大众',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        '在招职位 1',
                        style: TextStyle(
                          fontSize: 13.0
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        '宁波 | 不需要融资 | 150-500 | 金融',
                        style: TextStyle(
                          fontSize: 13.0
                        )
                      ),
                    ),
                    Text(
                      '这里可是简介吶哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒哒',
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.0
                      )
                    )
                  ]
                )
              )
            ),
          ],
        )
      )
    );
  
}