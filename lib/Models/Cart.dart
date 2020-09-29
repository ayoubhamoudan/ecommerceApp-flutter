import 'Product.dart';

class Cart {
  int totalQuantity ;
  int totalPrice;
  List  products ;
  Cart(this.totalQuantity , this.totalPrice, this.products);

  Cart.fromJson(Map<String , dynamic> jsonObject){
    this.totalPrice = jsonObject['totalPrice'];
    this.totalQuantity = jsonObject['totalQuantity'];
    _setProducts(jsonObject['items']);
  }

  _setProducts (List<dynamic> jsonProducts){
    this.products = [] ;
    for (var item in jsonProducts){
      var product = item['product'];
      this.products.add(Product.fromJson(product));
    }
  }
}