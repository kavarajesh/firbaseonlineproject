
import 'package:shared_preferences/shared_preferences.dart';

class common {
  static Future<bool>autologin()async{
    var sp = await SharedPreferences.getInstance();
    if(sp.containsKey('userid')){
      return true;
    }else{
      return false;
    }
  }
}

