import 'package:dio/dio.dart';

class ReviewsApi {
  Dio dio = Dio();

  Future getAllReviews () async {
    Response response = await dio.get('path');
  }
}