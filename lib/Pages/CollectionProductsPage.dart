import 'package:ecommerceapp/Blocs/CollectionsBloc/CollectionProductsBloc.dart';
import 'package:ecommerceapp/Components/AppbarComponent.dart';
import 'package:ecommerceapp/Components/DrawerComponent.dart';
import 'package:ecommerceapp/Components/PageTitleComponents.dart';
import 'package:ecommerceapp/Components/ProductsGridList.dart';
import 'package:ecommerceapp/Models/Collection.dart';
import 'package:ecommerceapp/Pages/PagesSizes/CollectionProductsPageSizes.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CollectionProductsPage extends StatefulWidget {
  Collection collection ;
  CollectionProductsPage(this.collection);

  @override
  _CollectionProductsPageState createState() => _CollectionProductsPageState();
}

class _CollectionProductsPageState extends State<CollectionProductsPage> {
  CollectionProductsBloc collectionProductsBloc = Get.put(CollectionProductsBloc());

  @override
  void dispose() {
    super.dispose();
    collectionProductsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    CollectionProductsPageSizes collectionProductsPageSizes = CollectionProductsPageSizes(screenConfig);
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBarComponent(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.09),
                child: PageTitleComponent(widget.collection.name, context),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              _productsList(collectionProductsPageSizes.ChildRatio),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productsList(double childRatio) {
    return StreamBuilder(
      stream: collectionProductsBloc.productsStream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            noConnectionWidget();
            break;
          case ConnectionState.waiting:
            loadingWidget();
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return errorWidget(snapshot.error);
            } else {
              if (!snapshot.hasData) {
                return Container();
              } else {
                return Wrap(
                  children: [
                    ProductsGridList(
                      snapshot.data,
                      snapshot.data.length,
                      childRatio,
                      context,
                    ),
                  ],
                );
              }
            }
            break;
        }
        return Container();
      },
    );
  }
}
