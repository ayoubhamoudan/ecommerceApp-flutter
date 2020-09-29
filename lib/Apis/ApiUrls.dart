class ApiUrls {
  static const String main_url = 'http://192.168.1.8:9000/api/' ;
  static const collections_url = main_url + 'collections' ;
  static const login_url = main_url + '/login';
  static const register_url = main_url + '/register';
  static String single_collection_url (collectionId){
    return collections_url + '/' + collectionId ;
  }
  static const products_url = main_url + 'products' ;
  static String products_by_collection_url (collectionId){
    return '$products_url?productCollection[_id]=$collectionId';
  }
  static const popular_products_url = main_url + 'products?sort=-averageRating' ;


  static const categories_url = main_url + 'categories' ;
  static String products_by_category_url (categoryId){
    return '$products_url?category[_id]=$categoryId';
  }

  static const featured_collection_url = main_url + 'collections?featured=true' ;

  static const add_to_cart_url = main_url + 'cart/add';
  static const cart_url = main_url + 'cart';
}