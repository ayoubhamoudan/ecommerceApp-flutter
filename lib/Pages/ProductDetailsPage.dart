import 'package:ecommerceapp/Apis/CartApi.dart';
import 'package:ecommerceapp/Apis/testBloc.dart';
import 'package:ecommerceapp/Blocs/CartBloc/AddToCartBloc.dart';
import 'package:ecommerceapp/Blocs/ProductsBloc/SimilarProductsBloc.dart';
import 'package:ecommerceapp/Components/AddToCartModal.dart';
import 'package:ecommerceapp/Components/ProductsHorizontalList.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:ecommerceapp/app_assets/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'PagesSizes/ProductDetailsPageSizes.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  ProductDetailsPage(this.product);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  AddToCartBloc addToCartBloc = Get.put(AddToCartBloc());
  CartApi cartApi = CartApi();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController;
  SimilarProductsBloc similarProductsBloc = SimilarProductsBloc();
  TestBloc testBloc = TestBloc();

  void initState() {
    super.initState();

    similarProductsBloc.addCategoryId(widget.product.category.id);
    _pageController = PageController(
      viewportFraction: 0.75,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    similarProductsBloc.dispose();
    addToCartBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    ProductDetailsPageSizes productDetailsPageSizes =
        ProductDetailsPageSizes(screenConfig);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print('object');
                  addToCartBloc.addProductId(widget.product.id);
                },
                child: _productImages(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _brand(productDetailsPageSizes.BrandFontSize),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            _productTitle(
                                productDetailsPageSizes.TitleFontSize),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: _productsStars(
                                productDetailsPageSizes.StarsSize,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            _priceText(productDetailsPageSizes.PriceFontSize),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            _inStock(productDetailsPageSizes.StockFontSize),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    _sectionTitle(
                      'Description',
                      productDetailsPageSizes.SectionTitleFonTSize,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    _productDescription(
                      productDetailsPageSizes.DescriptionFontSize,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    _sectionTitle(
                      'Similar Products',
                      productDetailsPageSizes.SectionTitleFonTSize,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    _similarProducts()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _addToCartButton(
          productDetailsPageSizes.PriceFontSize,
          productDetailsPageSizes.ButtonHeight,
          productDetailsPageSizes.AddToCartFontSize,
          productDetailsPageSizes.IconSize),
    );
  }

  Widget _addToCartButton(
    double PriceFontSize,
    ButtonHeight,
    AddToCartFontSize,
    IconSize,
  ) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              addToCartBloc.addProductId(widget.product.id);
              addToCartModal(context, PriceFontSize);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: ButtonHeight,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(88),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 9,
                        offset: Offset(0, 6),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 22.0),
                      child: Icon(
                        CustomIcons.bag,
                        color: Colors.white,
                        size: IconSize,
                      ),
                    ),
                    Text(
                      'Add to Cart',
                      style: GoogleFonts.poppins(
                          fontSize: AddToCartFontSize, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: ButtonHeight,
                width: MediaQuery.of(context).size.width * 0.14,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 9,
                        offset: Offset(0, 6),
                      )
                    ]),
                child: Icon(
                  CustomIcons.heart,
                  size: IconSize,
                )),
          ),
        ],
      ),
    );
  }

  Widget _productImages() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                right: MediaQuery.of(context).size.width * 0.02),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.images[index]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
        itemCount: widget.product.images.length,
      ),
    );
  }

  Widget _brand(double BrandFontSize) {
    return Text(
      widget.product.brand,
      style: GoogleFonts.bebasNeue(fontSize: BrandFontSize),
    );
  }

  Widget _productTitle(double TitleFontSize) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        widget.product.title,
        style: GoogleFonts.poppins(fontSize: TitleFontSize),
      ),
    );
  }

  Widget _inStock(double StockFontSize) {
    return widget.product.quantity <= 0
        ? Text(
            'Out Of Stock',
            style: GoogleFonts.poppins(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: StockFontSize,
            ),
          )
        : Text(
            'In stock',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: StockFontSize,
            ),
          );
  }

  Widget _priceText(double PriceFontSize) {
    String price = widget.product.price.toString();
    return Text(
      "\$ $price",
      style: GoogleFonts.poppins(fontSize: PriceFontSize),
    );
  }

  List<Widget> _productsStars(double starsSize) {
    List<Widget> stars = [];
    for (var i = 0; i < widget.product.averageRating; i++) {
      stars.add(
        Icon(
          Icons.star,
          color: Color(0xFFD4AF37),
          size: starsSize,
        ),
      );
    }
    return stars;
  }

  Widget _productDescription(double DescriptionFontSize) {
    return Text(
      widget.product.description,
      style: GoogleFonts.poppins(
          fontSize: DescriptionFontSize, color: Colors.grey.shade600),
    );
  }

  Widget _sectionTitle(String title, double SectionTitleFonTSize) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: SectionTitleFonTSize, fontWeight: FontWeight.w500),
    );
  }

  Widget _similarProducts() {
    return StreamBuilder(
      stream: similarProductsBloc.productsStream,
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
                    child: ProductsHorizontalListView(
                        snapshot.data, snapshot.data.length),
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

  Widget addToCartModal(BuildContext context, double PriceFontSize) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return AddToCartModal(context, widget.product);
      },
    );
  }
}
