import 'package:ecommerceapp/Apis/CollectionsApi.dart';
import 'package:ecommerceapp/Blocs/ProductsBloc/AllProductsBloc.dart';
import 'package:ecommerceapp/Blocs/ProductsBloc/PopularProductsBloc.dart';
import 'package:ecommerceapp/Components/AppbarComponent.dart';
import 'package:ecommerceapp/Components/DrawerComponent.dart';
import 'package:ecommerceapp/Components/ProductsGridList.dart';
import 'package:ecommerceapp/Components/ProductsHorizontalList.dart';
import 'package:ecommerceapp/Pages/AllProductsPage.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'PagesSizes/HomePageSizes.dart';
import 'PopularProductsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionApi collectionApi = CollectionApi();
  PopularProductsBloc popularProductsBloc = PopularProductsBloc();
  AllProductsBloc allProductsBloc = AllProductsBloc();

  @override
  void dispose() {
    super.dispose();
    popularProductsBloc.dispose();
    allProductsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    HomePageSizes homePageSizes = HomePageSizes(screenConfig);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBarComponent(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            _collectionSlider(
              homePageSizes.SliderTextFontSize,
              homePageSizes.ButtonTextFontSize,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            _popularProductsTitle(
              homePageSizes.SectionTitleFontSize,
              homePageSizes.SeeMoreFontSize,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            _popularProductsList(),
            SizedBox(
              height: height * 0.02,
            ),
            _allProductsTitle(homePageSizes.SectionTitleFontSize),
            SizedBox(
              height: height * 0.02,
            ),
            _allProductsList(homePageSizes.ChildRatio),
            SizedBox(
              height: height * 0.04,
            ),
            _seeMoreButton(context),
            SizedBox(
              height: height * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawSizedBox(double boxHeight, double boxWidth) {
    return SizedBox(
      height: boxHeight,
      width: boxWidth,
    );
  }

  Widget _collectionSlider(double textFontSize, double buttonTextFontSize) {
    return FutureBuilder(
      future: collectionApi.getFeaturedCollection(),
      builder: (context, snapshot) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return noConnectionWidget();
            break;
          case ConnectionState.waiting:
          case ConnectionState.active:
            return loadingWidget();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return errorWidget(snapshot.error);
            } else {
              if (!snapshot.hasData) {
                return noDataWidget();
              } else {
                return Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[_sliderImage(snapshot.data.image)],
                    ),
                    Transform.translate(
                      offset: Offset(width * 0.06, height * 0.25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _sliderText(snapshot.data.title, textFontSize),
                          _drawSizedBox(
                              MediaQuery.of(context).size.height * 0.06, 0),
                          _sliderButton(snapshot.data.id, buttonTextFontSize)
                        ],
                      ),
                    )
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

  Widget _sliderImage(String image) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.height * 0.69,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image, scale: 99),
        ),
      ),
    );
  }

  Widget _sliderText(String title, double textFontSize) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.poppins(
            fontSize: textFontSize, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _sliderButton(String collectionId, double textFontSize) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            radius: 25,
          ),
          _drawSizedBox(0, 15),
          Text(
            'SHOP NOW',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: textFontSize),
          ),
        ],
      ),
    );
  }

  Widget _popularProductsTitle(double SectionTitleFontSize, SeemoreFontSize) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Popular Products',
            style: GoogleFonts.poppins(
                fontSize: SectionTitleFontSize, fontWeight: FontWeight.w500),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PopularProductsPage()));
            },
            child: Text(
              'more',
              style: GoogleFonts.poppins(
                  fontSize: SeemoreFontSize,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }

  Widget _popularProductsList() {
    return StreamBuilder(
      stream: popularProductsBloc.productsStream,
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
                return Container(
                  height: MediaQuery.of(context).size.height * 0.47,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07),
                    child: ProductsHorizontalListView(snapshot.data, 4),
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

  Widget _allProductsList(double childRatio) {
    return StreamBuilder(
      stream: allProductsBloc.productsStream,
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
                return Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: MediaQuery.of(context).size.width * 0.07),
                      child: ProductsGridList(
                        snapshot.data,
                        snapshot.data.length,
                        childRatio,
                        context,
                      ),
                    )
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

  Widget _allProductsTitle(double SectionTitleFontSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 0, horizontal: MediaQuery.of(context).size.width * 0.07),
      child: Text(
        'All Products',
        textAlign: TextAlign.start,
        style: GoogleFonts.poppins(
            fontSize: SectionTitleFontSize, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _seeMoreButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.39,
        height: MediaQuery.of(context).size.height * 0.06,
        child: RaisedButton(
          child: Text(
            'See more',
            style: GoogleFonts.nunito(fontSize: 19, color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllProductsPage(),
              ),
            );
          },
          color: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
