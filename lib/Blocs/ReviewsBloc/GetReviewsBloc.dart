import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Models/Review.dart';
import 'package:rxdart/rxdart.dart';

class GetAllReviewsBloc implements Disposable {

  String productId ;
  List<Review> reviews ;

  BehaviorSubject <List<Review>> _reviewsController = BehaviorSubject <List<Review>> () ;
  Stream <List<Review>> get reviewsStream => _reviewsController.stream ;
  Function (List<Review>) get addReviews => _reviewsController.sink.add ;

  BehaviorSubject <String> _productIdController = BehaviorSubject <String> () ;
  Function (String) get addProductId => _productIdController.sink.add ;

  GetAllReviewsBloc(){
    getAllReviews();
  }

  Future getAllReviews () async {
    
  }

  @override
  void dispose() {
    _productIdController.close();
    _reviewsController.close();
  }
}