
import 'package:dio/dio.dart';
import 'package:ecommerceapp/Exceptions/redirect_found.dart';
import 'package:ecommerceapp/Exceptions/resource_not_found.dart';
import 'package:ecommerceapp/Models/Category.dart';
import 'package:ecommerceapp/Models/Product.dart';

import 'ApiUrls.dart';


class CategoriesApi {
  Dio dio = Dio();

  Future getAllCategories () async {
    Response response = await dio.get(ApiUrls.categories_url);
    switch(response.statusCode){
      case 404:
        throw ResourceNotFoundException();
        break ;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
      case 200:
        var data = response.data['data'] ;
        List<Category> categories = [];
        for (var item in data){
          categories.add(Category.fromJson(item));
        }
        return categories;
    }
    return null ;
  }

  Future getCategoryProducts(categoryId) async {
    Response response = await dio.get(ApiUrls.products_by_category_url(categoryId));
    switch(response.statusCode){
      case 404:
        throw ResourceNotFoundException();
        break ;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
      case 200:
        var data = response.data['data'] ;
        List<Product> products = [];
        for (var item in data){
          products.add(Product.fromJson(item));
        }
        return products;
    }
    return null ;
  }

}



