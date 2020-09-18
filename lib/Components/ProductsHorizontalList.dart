import 'package:ecommerceapp/Components/ListItemComponent.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:flutter/material.dart';

Widget ProductsHorizontalListView(List<Product> products , int length) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ListItemComponent(products, context, index),
      ) ;
    },
    itemCount: length,
  );
}
