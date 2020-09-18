import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:ecommerceapp/Models/Collection.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/exceptions/redirect_found.dart';
import 'package:ecommerceapp/exceptions/resource_not_found.dart';
import 'ApiUrls.dart';

class CollectionApi {
  Dio dio = Dio();

  Future getAllCollections() async {
    Response response = await dio.get(ApiUrls.collections_url);
    switch (response.statusCode) {
      case 404:
        throw ResourceNotFoundException();
        break;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
      case 200:
        var data = response.data['data']['data'];
        List<Collection> collections = [];
        for (var item in data) {
          collections.add(Collection.fromJson(item));
        }
        return collections;
    }
    return null;
  }

  Future getFeaturedCollection() async {
    Response response = await dio.get(ApiUrls.featured_collection_url);
    switch(response.statusCode){
      case 404:
        throw ResourceNotFoundException();
        break ;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
      case 200:
        var collection = response.data['data']['data'] ;
        return Collection.fromJson(collection[0]);
    }
    return null ;
  }

  Future getCollectionProducts(collectionId) async {
    Response response = await dio.get(ApiUrls.products_by_collection_url(collectionId));
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
