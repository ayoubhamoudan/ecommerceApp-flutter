import 'package:dio/dio.dart';
import 'package:ecommerceapp/Exceptions/resource_not_found.dart';

import 'ApiUrls.dart';

class CartApi {
  Dio dio = Dio();
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmMWFkYzQ5ZTc1NmJiMjIwMDkxYzM5OSIsImlhdCI6MTYwMDQ4MzQ2MywiZXhwIjoxNjAxMzQ3NDYzfQ.E0VL8l5i2icqBxTL22urrQ41Iu09oIhto544m7AOWRQ" ;

  Future addToCart(String productId , String size , int quantity) async {
    Map <String , dynamic> body = {
      'product' : productId,
      'quantity' : quantity,
      'size' : size,
    };
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