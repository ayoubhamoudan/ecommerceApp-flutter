import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/Models/User.dart';

class Review {
  String id, title, description;

  int rating;

  User user;

  Product product;

  Review(
    this.id,
    this.title,
    this.description,
    this.user,
    this.product,
    this.rating,
  );

  Review.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.description = jsonObject['description'];
    this.user = User.fromJson(jsonObject['user']);
    this.product = Product.fromJson(jsonObject['product']);
    this.title = jsonObject['title'];
    this.rating = jsonObject['rating'];
  }
}
