import 'package:ecommerceapp/Apis/CartApi.dart';
import 'package:ecommerceapp/Blocs/CartBloc/AddToCartBloc.dart';
import 'package:ecommerceapp/Blocs/ProductsBloc/SimilarProductsBloc.dart';
import 'package:ecommerceapp/Components/ProductsHorizontalList.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/Pages/ScreenSizes/ProductDetailsPageSizes.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:ecommerceapp/app_assets/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  ProductDetailsPage(this.product);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  AddToCartBloc addToCartBloc = AddToCartBloc();
  CartApi cartApi = CartApi();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController;
  SimilarProductsBloc similarProductsBloc = SimilarProductsBloc();

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
              _productImages(),
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
              addToCartBloc.addProductId.add(widget.product.id);
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

  Widget _quantityController() {
    return StreamBuilder(
      stream: addToCartBloc.quantityStream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return noConnectionWidget();
            break;
          case ConnectionState.waiting:
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    addToCartBloc.increase.add(snapshot.data);
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFF3F3F3),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: Text(
                    snapshot.data.toString(),
                    style: GoogleFonts.poppins(fontSize: 44),
                  ),
                ),
                InkWell(
                  onTap: () {
                    addToCartBloc.decrease.add(snapshot.data);
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFF3F3F3),
                    child: Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
            break;
        }
        return Container();
      },
    );
  }

  List<Widget> _cartSizes(currentSize) {
    List<Widget> sizes = [];
    for (var size in widget.product.sizes) {
      sizes.add(GestureDetector(
        onTap: () {
          addToCartBloc.addSize.add(size);
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: size == currentSize ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black, width: 2)),
              child: Center(
                  child: Text(
                size,
                style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: size == currentSize ? Colors.white : Colors.black),
              )),
            )),
      ));
    }
    return sizes;
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
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 30,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  widget.product.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
                _priceText(PriceFontSize),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Select Your Size',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                    stream: addToCartBloc.sizeStream,
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      String size = snapshot.data;
                      return Row(
                        children: _cartSizes(snapshot.data),
                        mainAxisAlignment: MainAxisAlignment.center,
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                _quantityController(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text(
                      'Add To Cart',
                      style: GoogleFonts.poppins(
                          fontSize: 22, color: Colors.white),
                    ),
                    onPressed: () {
                      addToCartBloc.addToCart();
                      Navigator.pop(context);
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content:
                              Text('Product added successfully to the cart'),
                          action: SnackBarAction(
                            label: 'close',
                            onPressed: () {
                              _scaffoldKey.currentState.hideCurrentSnackBar();
                            },
                          ),
                        ),
                      );
                    },
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
