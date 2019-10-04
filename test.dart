//坑啊坑啊都是坑, 只作记录

//1、基础的get 请求
// 需要用到 dio package
void getHttp(){
  try{
    Response respnse;
    Dio dio = new Dio();
    response = await dio.get("http://127.0.0.1:8009/XXX", queryParameters: {"pagename": "alljoblist", "countnum": "10", "currpage": "1"});
    String resString = response.data.toString();
    print(resString);
  }catch(e){
    print(e);
  }
}

//2.1、设置本地存储
// 这里用的是shared_preferences package
void _incrementCounter() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();//获取SharedPreferences实例
  prefs.setString("strKey", "strValue");
  prefs.setInt("intKey", "20");
}

//2.2 获取本地存储
void _incrementGet() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();//获取SharedPreferences实例
  print(prefs.getString('strKey'));
  print(prefs.getInt('intKey'));
}

//研究代理, post中