import 'Category.dart';
class Product {
  String id , title ,description , featuredImage , brand;
  Category category ;
  int price , quantity, discount  ;
  List<String> images ;
  List<String> sizes ;
  int averageRating ;


  Product(
      this.id,
      this.title,
      this.description,
      this.featuredImage,
      this.brand,
      this.category,
      this.price,
      this.quantity,
      this.discount,
      this.sizes,
      this.images,
      this.averageRating
      );

  Product.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['_id'] ;
    this.title = jsonObject['title'] ;
    this.description = jsonObject['description'] ;
    this.featuredImage = jsonObject['featuredImage'] ;
    this.brand = jsonObject['brand'] ;
    this.price = jsonObject['price'] ;
    this.discount = jsonObject['discount'] ;
    this.quantity = jsonObject['quantity'] ;
    this.category = Category.fromJson(jsonObject['category']);
    this.averageRating = jsonObject['averageRating'].round();
    _setImages(jsonObject['images']);
    _setSizes(jsonObject['sizes']);
  }
  
  
  _setImages(List<dynamic> jsonImages){
    this.images = [] ;
    for (var image in jsonImages){
     images.add(image['image']);
    }
  }

  _setSizes (List<dynamic> jsonSizes){
    this.sizes =[];
    for (var size in jsonSizes){
      sizes.add(size['size']);
    }
  }

}

