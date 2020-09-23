import 'package:ecommerceapp/Models/Product.dart';

class Cart {
  List <Product> products ;
  double totalPrice ;
  int totalQuantity ;

  Cart(this.products, this.totalPrice, this.totalQuantity);

  Cart.fromJson(Map<String , dynamic> jsonObject){
    _setProducts(jsonObject['items']);
    this.totalPrice = jsonObject['totalPrice'];
    this.totalQuantity = jsonObject['totalQuantity'];
  }

  _setProducts (List<Product> jsonProducts){
    List <Product> products = [] ;
    for (Product product in jsonProducts){
      products.add(product);
    }
  }
}

