import 'package:flutter/material.dart';

class ResourceNotFoundException implements Exception {
  ResourceNotFound(){
    return Center(
      child: Text('Page Not Found')
    );
  }
}