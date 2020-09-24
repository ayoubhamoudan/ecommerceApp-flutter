import 'package:dio/dio.dart';
import 'package:ecommerceapp/Apis/ApiUrls.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthApi {
  Dio dio = Dio();
  Future login (String email , String password ) async {
    Map <String , dynamic> body = {
      'email' : email,
      'password' : password,
    };
     try {
       var response = await dio.post(ApiUrls.login_url, data: body);
       String token = response.data['token'] ;
       await setToken(token);
       return response.data ;
     } catch (err){
       return err.response.data ;
     }
  }

  Future register (String email , String password , String name) async {
    Map <String , dynamic> body = {
      'name' : name,
      'email' : email,
      'password' : password,
    };
    try {
      var response = await dio.post(ApiUrls.register_url, data: body);
      String token = response.data['token'] ;
      await setToken(token);
      return response.data ;
    } catch (err){
      return err.response.data ;
    }
  }


  void setToken (String token) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('token', token);
  }

}