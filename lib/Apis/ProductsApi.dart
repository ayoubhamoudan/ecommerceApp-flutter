

import 'package:dio/dio.dart';
import 'package:ecommerceapp/Exceptions/redirect_found.dart';
import 'package:ecommerceapp/Exceptions/resource_not_found.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'ApiUrls.dart';

class ProductsApi{
  Dio dio = Dio();

  Future getAllProducts() async {
    Response response = await dio.get(ApiUrls.products_url);
    switch(response.statusCode){
      case 404:
        throw ResourceNotFoundException();
        break ;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
      case 200:
        var data = response.data['data'];
        List<Product> products = [];
        for (var item in data){
          products.add(Product.fromJson(item));
        }
        return products;
    }
    return null ;
  }

  Future getPopularProducts() async {
    Response response = await dio.get(ApiUrls.popular_products_url);
    switch(response.statusCode){
      case 404:
        throw ResourceNotFoundException();
        break ;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
      case 200:
        var data = response.data['data'];

        List<Product> products = [];
        for (var item in data){
          products.add(Product.fromJson(item));
        }
        return products;
    }
    return null ;
  }

}