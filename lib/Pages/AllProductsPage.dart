import 'package:ecommerceapp/Apis/CategoriesApi.dart';
import 'package:ecommerceapp/Blocs/ProductsBloc/ProductsByCategoryBloc.dart';
import 'package:ecommerceapp/Components/ProductsGridList.dart';
import 'package:ecommerceapp/Models/Category.dart';
import 'package:ecommerceapp/Pages/ScreenSizes/AllProductsPageSizes.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:ecommerceapp/app_assets/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  CategoriesApi categoriesApi = CategoriesApi();
  ProductsByCategoryBloc productsByCategoryBloc = ProductsByCategoryBloc();

  @override
  void dispose() {
    super.dispose();
    productsByCategoryBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    AllProductsPageSizes allProductsPageSizes = AllProductsPageSizes(screenConfig);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.13,
        ),
        child: _appBar(),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: productsByCategoryBloc.productsStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return noConnectionWidget();
                break;
              case ConnectionState.waiting:
                return loadingWidget();
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return errorWidget(snapshot.error);
                } else {
                  if (!snapshot.hasData) {
                    return noDataWidget();
                  } else {
                    return Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                      child: ProductsGridList(snapshot.data, snapshot.data.length, allProductsPageSizes.ChildRatio ,context ),
                    );
                  }
                }
                break;
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _appBar() {
    return FutureBuilder(
      future: categoriesApi.getAllCategories(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Container();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              errorWidget(snapshot.error);
            } else {
              if (!snapshot.hasData) {
                return noDataWidget();
              } else {
                List<Category> categories = snapshot.data;
                return DefaultTabController(
                  length: categories.length,
                  child: AppBar(
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    title: Text(
                      'fasho .',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    leading: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 27,
                      ),
                      onPressed: () {},
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          CustomIcons.bag,
                          size: 25,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      )
                    ],
                    bottom: TabBar(
                      indicatorColor: Colors.black,
                      unselectedLabelColor: Colors.grey.shade500,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(fontSize: 17),
                      isScrollable: true,
                      tabs: _tabs(snapshot.data),
                      onTap: (int index) {
                        print(index);
                        productsByCategoryBloc.addCategoryId(categories[index].id);
                      },
                    ),
                  ),
                );
              }
            }
            break;
        }
        return Container();
      },
    );
  }

  List<Tab> _tabs(List<Category> categories) {
    List<Tab> tabs = [];
    for (Category category in categories) {
      tabs.add(Tab(
        text: category.name,
      ));
    }
    return tabs;
  }
}
