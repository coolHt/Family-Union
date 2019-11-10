// //坑啊坑啊都是坑, 只作记录

// //1.1、基础的get 请求
// // 需要用到 dio package
// void getHttp() async{
//   try{
//     Response response;
//     Dio dio = new Dio();
//     response = await dio.get("http://127.0.0.1:8009/XXX", queryParameters: {"pagename": "alljoblist", "countnum": "10", "currpage": "1"});
//     String resString = response.data.toString();
//     print(resString);
//   }catch(e){ 
//     print(e);
//   }
// }
// //1.2 基础的post 请求
// void postHttp() async{
//   try{
//     Response response;
//     Map<String, dynamic> objData = xxx; //数据
//     Response response = await dio.post("http://122.xxx.xxx.xx:8241/xxx", data:objData);
//   }
// }

// //2.1、设置本地存储
// // 这里用的是shared_preferences package
// void _incrementCounter() async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();//获取SharedPreferences实例
//   prefs.setString("strKey", "strValue");
//   prefs.setInt("intKey", "20");
// }

// //2.2 获取本地存储
// void _incrementGet() async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();//获取SharedPreferences实例
//   print(prefs.getString('strKey'));
//   print(prefs.getInt('intKey'));
// }

// //3 获取本地IP
// // 需要用到io
// void getAddress() async{ //获取当前内网ip
//   for (var interface in await NetworkInterface.list()) {
//     for (var addr in interface.addresses) {
//       print('${addr.address}');
//     }
//   }
// }

// //4.1 代理外部服务器
// //需要用到shelf_proxy 库
// //引用
// import 'package:shelf/shelf_io.dart' as shelf_io;
// import 'package:shelf_proxy/shelf_proxy.dart';

// void proxyExternalServer(){
//   var server = await shelf_io.serve(
//     proxyHandler("http://122.xx.xxx.xx:xxxx"), //这是是需要代理过去的地址
//     'localhost',  //设置本地代理过去的地址
//       8022,  //设置贝蒂代理地址的端口
//   );
//   //代理过去之后才会执行下面的代码
//   //do something...
//   //可以向服务器发送请求等操作
//   print('Proxying at http://${server.address.host}:${server.port}');
// }

// //4.2 代理本地服务
// //利用dio 库
// //引用
// import 'package:dio/dio.dart';
// import 'package:dio/adapter.dart';

// void proxyLocalServer(){
//   Dio dio = new Dio();
//   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//     (HttpClient client) {
//       client.findProxy = (uri) {
//         //proxy all request to localhost:8888
//         return "PROXY localhost:各种端口";
//       };
//       client.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;
//     };
// }