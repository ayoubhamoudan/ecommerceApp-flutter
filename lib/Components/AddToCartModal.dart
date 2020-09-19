import 'package:ecommerceapp/Apis/testBloc.dart';
import 'package:ecommerceapp/Blocs/CartBloc/AddToCartBloc.dart';
import 'package:ecommerceapp/Components/ComponentsSizes/AddToCartMOdalSizes.dart';
import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/Utils/HelperWidgets.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:ecommerceapp/app_assets/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AddToCartBloc addToCartBloc = Get.put(AddToCartBloc());
Widget AddToCartModal(BuildContext context, Product product) {
  ScreenConfig screenConfig = ScreenConfig(context);
  AddToCartModalSizes addToCartModalSizes = AddToCartModalSizes(screenConfig);
  return Container(
    height: MediaQuery.of(context).size.height * 0.8,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _image(context, product.featuredImage,
                  addToCartModalSizes.ImageWidth),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _brand(addToCartModalSizes.BrandFontSize, product.brand),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  _productTitle(addToCartModalSizes.TitleFontSize,
                      product.title, context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  _priceText(product.price, addToCartModalSizes.PriceFontSize)
                ],
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          _sectionTitle(
            'Select Your Size',
            addToCartModalSizes.SectionTitleFonTSize,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          StreamBuilder(
            stream: addToCartBloc.sizeStream,
            builder: (context, AsyncSnapshot<String> snapshot) {
              return Row(
                children: _cartSizes(
                  snapshot.data,
                  product.sizes,
                  addToCartModalSizes.SizeContainerWidth,
                  addToCartModalSizes.SizeContainerHeigth,
                  addToCartModalSizes.SizeFontSize
                ),
                mainAxisAlignment: MainAxisAlignment.center,
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          _quantityController(addToCartModalSizes.QuantityFontSize, addToCartModalSizes.AvatarRadius),
          _addToCartButton(context, addToCartModalSizes.AddToCartFontSize, addToCartModalSizes.ButtonHeight, addToCartModalSizes.IconSize)
        ],
      ),
    ),
  );
}

Widget _image(BuildContext context, String ProductImage, double ImageWidgth) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    width: MediaQuery.of(context).size.width * ImageWidgth,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(ProductImage))),
  );
}

Widget _brand(double BrandFontSize, String ProductBrand) {
  return Text(
    ProductBrand,
    style: GoogleFonts.bebasNeue(fontSize: BrandFontSize),
  );
}

Widget _productTitle(double TitleFontSize, ProductTitle, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    child: Text(
      ProductTitle,
      style: GoogleFonts.poppins(fontSize: TitleFontSize),
    ),
  );
}

Widget _priceText(int ProductPrice, double PriceFontSize) {
  return Text(
    "\$ $ProductPrice",
    style: GoogleFonts.poppins(fontSize: PriceFontSize),
  );
}

Widget _sectionTitle(String title, double TitleFontSize) {
  return Text(
    title,
    style: GoogleFonts.poppins(
      fontSize: TitleFontSize,
      fontWeight: FontWeight.w500,
    ),
  );
}

List<Widget> _cartSizes(
    selectedSize,
    List<String> ProductSizes,
    double SizeContainerWidth,
    double SizeContainerHeigth,
    double SizeFontSize) {
  List<Widget> sizes = [];
  for (var size in ProductSizes) {
    sizes.add(GestureDetector(
      onTap: () {
        addToCartBloc.addSize.add(size);
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: SizeContainerHeigth,
            width: SizeContainerWidth,
            decoration: BoxDecoration(
                color: size == selectedSize ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black, width: 2)),
            child: Center(
                child: Text(
              size,
              style: GoogleFonts.poppins(
                  fontSize: SizeFontSize,
                  color: size == selectedSize ? Colors.white : Colors.black),
            )),
          )),
    ));
  }
  return sizes;
}

Widget _quantityController(double QuantityFontSize, double AvatarRadius) {
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
                  radius: AvatarRadius,
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
                  style: GoogleFonts.poppins(fontSize: QuantityFontSize),
                ),
              ),
              InkWell(
                onTap: () {
                  addToCartBloc.decrease.add(snapshot.data);
                },
                child: CircleAvatar(
                  radius: AvatarRadius,
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


Widget _addToCartButton ( BuildContext context ,double AddToCartFontSize , double ButtonHeight , double IconSize){
  return GestureDetector(
    onTap: () {
      addToCartBloc.addToCart();
      Navigator.pop(context);
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
  );
}