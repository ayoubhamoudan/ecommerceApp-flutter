import 'package:ecommerceapp/Blocs/ProductsBloc/PopularProductsBloc.dart';
import 'package:ecommerceapp/Components/AppbarComponent.dart';
import 'package:ecommerceapp/Components/PageTitleComponents.dart';
import 'package:ecommerceapp/Components/ProductsGridList.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';

import 'PagesSizes/PopularProductsPageSizes.dart';

class PopularProductsPage extends StatefulWidget {
  @override
  _PopularProductsPageState createState() => _PopularProductsPageState();
}

class _PopularProductsPageState extends State<PopularProductsPage> {
  PopularProductsBloc popularProductsBloc = PopularProductsBloc();
  @override
  void dispose() {
    super.dispose();
    popularProductsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    PopularProductsPageSizes popularProductsPageSizes =
        PopularProductsPageSizes(screenConfig);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBarComponent(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.09),
                child: PageTitleComponent('Popular Products', context),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              _productsList(popularProductsPageSizes.ChildRatio),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productsList(double childRatio) {
    return StreamBuilder(
      stream: popularProductsBloc.productsStream,
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
                return noDataWidget();
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
