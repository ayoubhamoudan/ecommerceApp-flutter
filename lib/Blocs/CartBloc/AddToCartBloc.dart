import 'dart:async';
import 'package:ecommerceapp/Apis/CartApi.dart';
import 'package:rxdart/rxdart.dart';

class AddToCartBloc {
  CartApi cartApi = CartApi();
  int quantity ;
  String productId ;
  String size ;

  BehaviorSubject <String> _sizeController = BehaviorSubject<String>();
  Stream <String> get sizeStream => _sizeController.stream ;
  StreamSink <String> get addSize => _sizeController.sink ;


  BehaviorSubject <String> _productIdController = BehaviorSubject<String>();
  Function (String) get addProductId => _productIdController.sink.add ;


  BehaviorSubject <int> _quantityController = BehaviorSubject <int> ();
  Stream <int> get quantityStream => _quantityController.stream ;
  StreamSink <int> get addQuantity => _quantityController.sink ;


  BehaviorSubject <int> _increaseController =  BehaviorSubject <int> ();
  StreamSink <int> get increase => _increaseController.sink;

  BehaviorSubject <int> _decreaseController = BehaviorSubject <int> ();
  StreamSink <int> get decrease => _decreaseController.sink ;




  AddToCartBloc (){
    quantity = 1 ;
    _quantityController.add(quantity);
    _increaseController.stream.listen(_increaseQuantity);
    _decreaseController.stream.listen(_decreaseQuantity);
  }

  void _increaseQuantity (int quantity){
    quantity ++ ;
    addQuantity.add(quantity);
  }

  void _decreaseQuantity  (int quantity){
    if (quantity > 1){
      quantity -- ;
    }
    addQuantity.add(quantity);
  }

  addToCart (){
    String productId = _productIdController.value ;
    String size = _sizeController.value ;
    int quantity = _quantityController.value ;
    cartApi.addToCart(productId, size , quantity);
  }

  void dispose (){
    _productIdController.close();
    _sizeController.close();
    _quantityController.close();
    _decreaseController.close();
    _increaseController.close();
  }
}
