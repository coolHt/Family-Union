//通用方法

//验证手机格式
bool identifyPhoneType(num){
  bool isMatch = RegExp(r"^1[34578]\d{9}$").hasMatch(num);
  return isMatch;
}