import 'dart:async';

import 'package:ecommerceapp/Apis/CategoriesApi.dart';
import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Models/Category.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:rxdart/rxdart.dart';

class SimilarProductsBloc implements Disposable {


  List <Product> products ;
  String categoryId ;
  CategoriesApi categoriesApi = CategoriesApi();


  BehaviorSubject <List<Product>> _productsController = BehaviorSubject<List<Product>>();
  Stream <List<Product>> get productsStream => _productsController.stream.take(10) ;
  Sink <List<Product>> get addProducts => _productsController.sink;


  BehaviorSubject <String> _categoryIdController = BehaviorSubject<String>() ;
  Function(String) get addCategoryId => _categoryIdController.sink.add ;

  SimilarProductsBloc(){
    this.products = [];
    _productsController.add(this.products);
    _categoryIdController.stream.listen(getCategoryProducts);
  }

  Future getCategoryProducts (categoryId) async {
    this.products = await categoriesApi.getCategoryProducts(_categoryIdController.value);
    addProducts.add(this.products);
  }

  @override
  void dispose() {
    _productsController.close();
    _categoryIdController.close();
  }

}