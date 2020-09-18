import 'dart:async';

import 'package:ecommerceapp/Apis/CollectionsApi.dart';
import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:rxdart/rxdart.dart';

class CollectionProductsBloc implements Disposable {
  CollectionApi collectionApi = CollectionApi();
  List<Product> products  ;
  String collectionId ;

  final StreamController <List<Product>> _productsController = StreamController <List<Product>>();
  Stream <List<Product>> get productsStream => _productsController.stream ;

  final StreamController <String> _collectionIdController = StreamController<String>();
  StreamSink  <String> get addCollection => _collectionIdController.sink ;
  Stream <String> get categoryStream => _collectionIdController.stream ;

  CollectionProductsBloc(){
    _productsController.add(this.products);
    _collectionIdController.stream.listen(fetchProducts);
  }

  Future fetchProducts (String category) async {
    this.products = await collectionApi.getCollectionProducts(category);
    _productsController.add(this.products);
  }

  @override
  void dispose() {
    _productsController.close();
    _collectionIdController.close();
  }
}