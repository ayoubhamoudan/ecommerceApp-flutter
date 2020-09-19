import 'dart:async';

import 'package:rxdart/rxdart.dart';

class TestBloc {


  BehaviorSubject <String> _productIdController = BehaviorSubject<String>();
  StreamSink <String> get addProductId => _productIdController.sink ;

  printId (){
    print(_productIdController.value);
  }

  dispose (){
    _productIdController.close();
  }
}