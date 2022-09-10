
import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static Writestring(String key,String value)async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString(key, value);
    shared.commit();
  }
 static Future<String> RedString(String value)async{
    SharedPreferences read = await SharedPreferences.getInstance();
    read.getString(value);
    print('${value.toString()}=========sahredPre ========= redString ======');
    print(read.get('${value}'));
    read.commit();
    return  value;
  }
  static logout()async {
   SharedPreferences logout = await SharedPreferences.getInstance();
   logout.clear();
   logout.setString('userid', '');
   logout.commit();
  }
  static Redint(String value)async{
    SharedPreferences read = await SharedPreferences.getInstance();
    read.getInt(value);
    print('${value.toString()}=========sahredPre ========= redString ======');
    print(read.getInt('${value}'));
    read.commit();

  }
  static Writeint(String key,int value)async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setInt(key, value);
    shared.commit();
  }


}