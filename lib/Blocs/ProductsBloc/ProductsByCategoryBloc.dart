import 'dart:async';
import 'package:ecommerceapp/Apis/CategoriesApi.dart';
import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Models/Category.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:rxdart/rxdart.dart';


class ProductsByCategoryBloc implements Disposable {
  List <Product> products ;
  List<Category> categories ;
  String categoryId ;
  CategoriesApi categoriesApi = CategoriesApi();


  BehaviorSubject <List<Product>> _productsController = BehaviorSubject<List<Product>>();
  Stream <List<Product>> get productsStream => _productsController.stream ;
  Sink <List<Product>> get addProducts => _productsController.sink;


  BehaviorSubject <String> _categoryIdController = BehaviorSubject<String>() ;
  Function(String) get addCategoryId => _categoryIdController.sink.add ;

  ProductsByCategoryBloc(){
    loadCategoryId();
    this.products = [];
    _productsController.add(this.products);
    _categoryIdController.stream.listen(getCategoryProducts);
  }


  Future loadCategoryId () async {
    this.categories = await categoriesApi.getAllCategories();
    this.categoryId = this.categories[0].id ;
    _categoryIdController.add(this.categoryId);
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