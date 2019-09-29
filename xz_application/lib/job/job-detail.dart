import 'package:flutter/material.dart';
//公共widget
import '../common.dart' as Common;

class JobDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //接收参数
    final Map jName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(jName['jobname'])
      ),
      body:Container(
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            jobProfile(), //职位简介
            jobDescription(), //职位描述
          ],
        )
      )
    );
  }
}

//头部职位简介
Card jobProfile(){
  return Card(
    margin: EdgeInsets.fromLTRB(0, 18.0, 0, 18.0),
    child: Padding(
      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    '4s店总经理',
                    softWrap:false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    '宁波 - 江北区 | 1-3年 | 本科 | 全职',
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  )
                ),
                Text(
                  '7k - 14k',
                  style: TextStyle(
                    color: Colors.red[600],
                    fontWeight: FontWeight.bold
                  )
                )
              ]
            ),
          ),
          Expanded(
            flex: 1,
            child: Image(
              width: 50.0,
              height:50.0,
              image: AssetImage('images/cPic.jpg'),
              alignment: Alignment.topRight,
            )
          )
          
        ],
      )
    ) 
  );
}

//职位描述
Container jobDescription(){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Common.maximumTitle('职位描述'),
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child:Wrap(
            children: <Widget>[
              tagStyle('标签1')
            ],
          ),
        ),
        Text(
          '工作内容',
          style: TextStyle(
            height: 1.3
          )
        ),
        Text(
          '1. webapp开发',
          style: TextStyle(
            height: 1.3
          ),
        ),
        Text(
          '2. 熟练angular codova reactive ionic中的一种',
          style: TextStyle(
            height: 1.3
          )
        )
      ]
    )
  );
}
//标签
Container tagStyle(tag){
  return Container(
    padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
    margin: EdgeInsets.fromLTRB(0, 0, 10.0, 10.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 238, 238, 238)
    ),
    child: Text(
      tag,
      style: TextStyle(
        color: Colors.black54
      ),
    )
  );
}

