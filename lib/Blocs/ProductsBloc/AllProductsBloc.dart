import 'package:ecommerceapp/Apis/ProductsApi.dart';
import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:rxdart/rxdart.dart';


class AllProductsBloc implements Disposable {
  ProductsApi productsApi = ProductsApi();
  List <Product> products;

  BehaviorSubject <List<Product>> _productsController = BehaviorSubject<List<Product>>();
  Stream <List<Product>> get productsStream => _productsController.stream;
  Sink <List<Product>> get addProducts => _productsController.sink;


  AllProductsBloc() {
    getAllProducts();
  }

  Future getAllProducts() async {
    this.products = await productsApi.getAllProducts();
    addProducts.add(this.products);
  }

  @override
  void dispose() {
    _productsController.close();
  }
}