import 'package:flutter/material.dart';

class RedirectionFoundException implements Exception {
  RedirectionFound(){
    return Center(
        child: Text('Redirection Found')
    );
  }
}