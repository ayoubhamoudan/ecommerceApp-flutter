import 'package:dio/dio.dart';

import 'ApiUrls.dart';

class CartApi {
  Dio dio = Dio();
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmMWFkYzQ5ZTc1NmJiMjIwMDkxYzM5OSIsImlhdCI6MTU5ODAyMTk5OCwiZXhwIjoxNTk4ODg1OTk4fQ.irAAWeR2P2aERAcECBh1dnzcsV5AxNhMb9W0IMZEzMY" ;

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

    }
  }
}