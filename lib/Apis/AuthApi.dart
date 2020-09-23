import 'package:dio/dio.dart';
import 'package:ecommerceapp/Apis/ApiUrls.dart';

class AuthApi {
  Dio dio = Dio();

  Future login (String email , String password) async {
    Map <String , dynamic> body = {
      'email' : email,
      'password' : password,
    };
      var response = await dio.post(ApiUrls.login_url, data: body);
      return response ;

  }
}