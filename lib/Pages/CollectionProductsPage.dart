import 'package:ecommerceapp/Components/AppbarComponent.dart';
import 'package:flutter/material.dart';


class CollectionProductsPage extends StatefulWidget {
  @override
  _CollectionProductsPageState createState() => _CollectionProductsPageState();
}

class _CollectionProductsPageState extends State<CollectionProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(context),
    );
  }
}
