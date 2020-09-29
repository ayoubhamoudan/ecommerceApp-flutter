import 'dart:async';
import 'package:ecommerceapp/Apis/CartApi.dart';
import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Models/Cart.dart';

class GetCartBloc implements Disposable {
  CartApi cartApi = CartApi();
  Cart cart ;
  double totalQuantity ;
  double totalPrice ;

  final StreamController <Cart> _cartController = StreamController<Cart>.broadcast();
  Stream <Cart> get cartStream => _cartController.stream ;
  Function (Cart) get addCart => _cartController.sink.add ;

  final StreamController <double>  _increaseQuantityController = StreamController <double> ();
  Function (double) get increaseCart => _increaseQuantityController.sink.add ;

  final StreamController <double>  _decreaseQuantityController = StreamController <double> ();
  Function (double) get decreaseCart => _decreaseQuantityController.sink.add ;



  GetCartBloc(){
    _getCart();

  }


  Future _getCart () async {
    this.cart = await cartApi.getCart();
    addCart(this.cart);
  }

  Future _increaseCart () async {}
  Future _decreaseCart () async {}



  @override
  void dispose() {
    _cartController.close();
    _increaseQuantityController.close();
    _decreaseQuantityController.close();
    _cartController.close();
  }

}