import 'package:ecommerceapp/Components/ListItemComponent.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:flutter/material.dart';

Widget ProductsGridList(List<Product> products, int length, double childRatio , BuildContext context) {
    return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: childRatio,
      mainAxisSpacing: MediaQuery.of(context).size.height * 0.05 ,
    ),
    itemCount: length,
    itemBuilder: (context, index) {
      return ListItemComponent(products, context, index);
    },
  );
}
