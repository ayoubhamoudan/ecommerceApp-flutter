import 'package:dio/dio.dart';
import 'package:ecommerceapp/Exceptions/resource_not_found.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiUrls.dart';

class CartApi {
  Dio dio = Dio();

  Future addToCart(String productId , String size , int quantity) async {
    Map <String , dynamic> body = {
      'product' : productId,
      'quantity' : quantity,
      'size' : size,
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =  prefs.get('token');
    try {
      await dio.post(ApiUrls.add_to_cart_url , data: body , options: Options(
          headers: {
            'Authorization' : "Bearer " + token ,
          }
      ));
    }
    catch (err){
      throw ResourceNotFoundException();
    }
  }

  Future getCard () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =  prefs.get('token');
    try {
      Response response =  await dio.get(ApiUrls.add_to_cart_url  , options: Options(
          headers: {
            'Authorization' : "Bearer " + token ,
          }
      ));
    }
    catch (err){
      throw ResourceNotFoundException();
    }
  }
}